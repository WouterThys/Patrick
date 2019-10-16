package com.waldo.patrick.database.classes;

import java.util.Objects;

public abstract class BaseDbObject implements IDbObject {

    protected String name;


    @Override
    public String toString() {
        return getName();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof BaseDbObject)) return false;
        BaseDbObject that = (BaseDbObject) o;
        return Objects.equals(getName(), that.getName());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getName());
    }

    @Override
    public String getName() {
        if (name == null) {
            name = "";
        }
        return name;
    }
}
