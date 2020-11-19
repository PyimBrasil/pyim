package br.com.pyim.mgpyim.controller.exceptions.project;

public class DataBaseException extends RuntimeException{
    private static final long serialVersionUID = 1L;

    public DataBaseException(String message) {
        super(message);
    }
    
}