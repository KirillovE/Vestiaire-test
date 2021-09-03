import RealmSwift

/// Persisted temperature object by fractions of a day
public final class Temperature: Object {
    
    @Persisted var morning: Int
    @Persisted var day: Int
    @Persisted var evening: Int
    @Persisted var night: Int
    
}
