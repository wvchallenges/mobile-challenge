import {Fetcher} from 'swr';

const token = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm";

export const waveApiFetcher: Fetcher<any> = (url: string, businessId: string) =>
  fetch(
    `https://api.waveapps.com/businesses/${businessId}${url}`,
    {
        method: 'GET',
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json'
        }
    }
  ).then(res => res.json());
