abstract class Mapper<To, From> {
  To toEntity(From response);
}
