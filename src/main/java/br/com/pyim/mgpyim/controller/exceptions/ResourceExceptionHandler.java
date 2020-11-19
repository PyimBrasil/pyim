package br.com.pyim.mgpyim.controller.exceptions;

import java.time.Instant;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import br.com.pyim.mgpyim.controller.exceptions.project.DataBaseException;
import br.com.pyim.mgpyim.controller.exceptions.project.ResourceNotFoundException;


@ControllerAdvice
public class ResourceExceptionHandler{
    @ExceptionHandler(DataBaseException.class)
    public StandardErro entityNotFound(DataBaseException e, HttpServletRequest request){
        HttpStatus status = HttpStatus.NOT_FOUND;
        StandardErro error = new StandardErro();
        error.setTimestamp(Instant.now());
        error.setStatus(status.value());
        error.setError("Resource not found");
        error.setMessage(e.getMessage());
        error.setPath(request.getRequestURI());
        return error;
    }

    @ExceptionHandler(ResourceNotFoundException.class)
    public StandardErro database(ResourceNotFoundException  e, HttpServletRequest request){
        HttpStatus status = HttpStatus.BAD_REQUEST;
        StandardErro error = new StandardErro();
        error.setTimestamp(Instant.now());
        error.setStatus(status.value());
        error.setError("Database exception");
        error.setMessage(e.getMessage());
        error.setPath(request.getRequestURI());
        return error;
    }
}

