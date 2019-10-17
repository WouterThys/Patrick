package com.waldo.patrick.scripts;

public class StoredProcedure implements IStoredProcedure {

    private String name;
    private String content;

    public void setName(String name) {
        this.name = name;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String getName() {
        return name;
    }

    @Override
    public String getContent() {
        return content;
    }
}
