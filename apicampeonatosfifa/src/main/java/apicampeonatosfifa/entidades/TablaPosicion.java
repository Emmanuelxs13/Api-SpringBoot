package apicampeonatosfifa.entidades;

/**
 * Clase simple para mapear los resultados de la función SQL fTablaPosicionesGrupo.
 * No es una entidad JPA, solo un POJO para transportar datos.
 */
public class TablaPosicion {

    private Long id;
    private String pais;
    private Integer pJ;  // Partidos Jugados
    private Integer pG;  // Partidos Ganados
    private Integer pE;  // Partidos Empatados
    private Integer pP;  // Partidos Perdidos
    private Integer gF;  // Goles a Favor
    private Integer gC;  // Goles en Contra
    private Integer puntos;

    // Constructores
    public TablaPosicion() {
    }

    public TablaPosicion(Long id, String pais, Integer pJ, Integer pG, Integer pE, Integer pP, 
                        Integer gF, Integer gC, Integer puntos) {
        this.id = id;
        this.pais = pais;
        this.pJ = pJ;
        this.pG = pG;
        this.pE = pE;
        this.pP = pP;
        this.gF = gF;
        this.gC = gC;
        this.puntos = puntos;
    }

    // Getters y Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public Integer getpJ() {
        return pJ;
    }

    public void setpJ(Integer pJ) {
        this.pJ = pJ;
    }

    public Integer getpG() {
        return pG;
    }

    public void setpG(Integer pG) {
        this.pG = pG;
    }

    public Integer getpE() {
        return pE;
    }

    public void setpE(Integer pE) {
        this.pE = pE;
    }

    public Integer getpP() {
        return pP;
    }

    public void setpP(Integer pP) {
        this.pP = pP;
    }

    public Integer getgF() {
        return gF;
    }

    public void setgF(Integer gF) {
        this.gF = gF;
    }

    public Integer getgC() {
        return gC;
    }

    public void setgC(Integer gC) {
        this.gC = gC;
    }

    public Integer getPuntos() {
        return puntos;
    }

    public void setPuntos(Integer puntos) {
        this.puntos = puntos;
    }
}
