import {Fetcher} from 'swr';
import {Product} from './models/Product';

const token = '6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm';
const businessId = '89746d57-c25f-4cec-9c63-34d7780b044b';

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
) => waveApiFetcher(`${businessId}${url}`);
