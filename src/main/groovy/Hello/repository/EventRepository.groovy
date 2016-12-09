package Hello.repository

import Hello.model.Event
import org.springframework.data.mongodb.repository.MongoRepository

interface EventRepository extends MongoRepository<Event, String> {
}
