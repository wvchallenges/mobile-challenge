package ai.victorl.wavechallengeapp.services.wave;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Path;
import retrofit2.http.Query;

/**
 * Interface for Retrofit to retrieve content from the Products endpoint of the Wave API.
 *
 * @see <a href="http://docs.waveapps.io/endpoints/products.html#get--businesses-business_id-products-">link</a>
 */
public interface ProductsService {
    @GET("/businesses/{business_id}/products/")
    Call<List<BusinessProduct>> getBusinessProducts(@Path("business_id") String businessId, @Query("access_token") String token);
}
