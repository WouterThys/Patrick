package com.waldo.patrick.database.classes;

public enum ScriptState {

    Failed(-1),
    Pending(0),
    Executing(1),
    Executed(2),
    Manual(3)
    ;

    final int intValue;

    ScriptState(int intValue) {
        this.intValue = intValue;
    }

    public int getIntValue() {
        return intValue;
    }

    public static ScriptState fromInt(int intValue) {
        switch (intValue) {
            default:
            case 0:
                return Pending;

            case -1:
                return Failed;
            case 1:
                return Executing;
            case 2:
                return Executed;
            case 3:
                return Manual;
        }
    }

    }
