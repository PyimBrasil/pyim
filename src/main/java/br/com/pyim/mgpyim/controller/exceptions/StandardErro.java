package br.com.pyim.mgpyim.controller.exceptions;

import java.time.Instant;

public class StandardErro {
    private Instant timestamp;
    private int status;
    private String error;
    private String message;
    private String path;

    public StandardErro() {
    }

    public Instant getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Instant timestamp) {
        this.timestamp = timestamp;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Override
    public String toString() {
        return "Error=" + error + "\nmessage=" + message + "\npath=" + path + "\nstatus=" + status
                + "\ntimestamp=" + timestamp;
    }

    
}
