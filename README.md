# OpenNMT Baseline
OpenNMT Baseline for Headline Generation shared task on Dialogue 2019

This baseline cut off the first sentence in a news article body. Then whis phrase is tekonized by _sentecepiece_, 
learned on [Rossiya Segodnya corpus](https://github.com/RossiyaSegodnya/ria_news_dataset). The tokenized sequence
is processed by seq2seq implemented on _OpenNMT_ framework, also learned on Rossiya Segodnya corpus. The resulting 
sequence then de-tokenized to get hypothesis for article title.

To use it: 
1) fork and/or clone the repo;
2) login into shared task private registry with command `sudo docker login headlinegen.vkpartner.ru:5001`
3) build docker image with command `sudo docker build --tag headlinegen.vkpartner.ru:5001/{your_token} .`
4) push docker image to registry with command `sudo docker push headlinegen.vkpartner.ru:5001/{your_token}`
5) click __Валидировать__ on [shared task website](https://headlinegen.vkpartner.ru/submit_page).
