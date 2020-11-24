package br.com.pyim.mgpyim.entities.enums;

public enum ServiceStatus {
    PENDING(0), COMPLETE(1), CANCELED(2), IN_PROGRESS(3);

    private ServiceStatus(int value) {
    }
}
