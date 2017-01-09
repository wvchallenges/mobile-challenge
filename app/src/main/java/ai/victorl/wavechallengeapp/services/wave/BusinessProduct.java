package ai.victorl.wavechallengeapp.services.wave;

/**
 * Wave Business Products model as referenced by
 * <a href="http://docs.waveapps.io/endpoints/products.html#attributes">Attributes</a>
 */
public class BusinessProduct {
    public Integer id;
    public String url;
    public String name;
    public Double price;
    public String description;
    public Boolean is_sold;
    public Boolean is_bought;
    public Boolean active;
}
