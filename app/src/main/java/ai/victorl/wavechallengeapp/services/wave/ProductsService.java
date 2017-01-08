package ai.victorl.wavechallengeapp.services.wave;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Path;
import retrofit2.http.Query;

public interface ProductsService {
    @GET("/businesses/{business_id}/products/")
    Call<List<BusinessProduct>> getBusinessProducts(@Path("business_id") String businessId, @Query("access_token") String token);
}
