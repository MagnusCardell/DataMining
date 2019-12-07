package se.kth.jabeja.config;

public enum TaskName {
    TASK1("TASK1"),
    TASK2("TASK2"),
    BONUS("BONUS");
    String name;
    TaskName(String name) {
        this.name = name;
    }
    @Override
    public String toString() {
        return name;
    }
}
