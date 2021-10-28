import {Fetcher} from 'swr';
import {Product} from './models/Product';

const token = '6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm';

export const waveApiFetcher: Fetcher<any> = (url: string) =>
  fetch(`https://api.waveapps.com/businesses/${url}`, {
    method: 'GET',
    headers: {
      Authorization: `Bearer ${token}`,
      'Content-Type': 'application/json',
    },
  }).then(res => res.json());

export const productFetcher: Fetcher<Product[]> = (
  url: string,
  businessId: string,
) => waveApiFetcher(`${businessId}${url}`);
