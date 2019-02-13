package sample.web.ui;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import java.util.*;
//import java.util.concurrent.ConcurrentMap;
//import java.util.concurrent.atomic.AtomicLong;


@Repository
public class MessageRepositoryImpl implements MessageRepository {

    private static final String KEY = "Message";

    private RedisTemplate<String, Object> redisTemplate;
    private HashOperations<String, Long, Message> hashOperations;

    @Autowired
    public MessageRepositoryImpl(RedisTemplate<String, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }
    @PostConstruct
    private void init() {
        hashOperations = redisTemplate.opsForHash();
    }

    @Override
    public Iterable<Message> findAll() {
        TreeMap<Long,Message> messages = new TreeMap<Long,Message>(hashOperations.entries(KEY));
        return messages.values();
    }

    @Override
    public Message save(Message message) {
        Long id = message.getId();

        if (id == null) {
            id = Long.valueOf(hashOperations.entries(KEY).size()+1);
            message.setId(id);
        }
        hashOperations.put(KEY, message.getId(), message);
        return message;
    }

    @Override
    public Message findMessage(Long id) {
        return hashOperations.get(KEY, id);
    }

    @Override
    public void deleteMessage(Long id) {
        hashOperations.delete(KEY, id);
    }
}
