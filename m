Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2934B7503
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 19 Sep 2019 10:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731882AbfISIWS (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 19 Sep 2019 04:22:18 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35553 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730886AbfISIWR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 04:22:17 -0400
Received: by mail-wr1-f68.google.com with SMTP id v8so2104957wrt.2;
        Thu, 19 Sep 2019 01:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LeVWiP96skI5eB7uqPIrDv7wt1djjgh1Br2ODaNGKJs=;
        b=jlsvIhwqv5qdogDj5b32U6hfeGaj31SecjcP5mV/7lq2jyqeDfy7MkmgoKr+8txtIA
         UPwaiQLf4nkIYY/0rGgjOvYPREFX4ldJqteVpj+zOlmyxOa1FTcp9PmJbqT+J2G3o+k6
         hj17b1wbko5Ls8+TcBXcgw3y16hf2Z5C3gGvwg42V7xUUz/j9krBGRhyfTEQLc2Xu9v0
         Iw15raR+pMk4DZExr09O/xACf/GOGFZkaIW59vLkwlon99nEe0Kil63KWOVDRgKHOr+D
         ZMXsdJN54SCnV7dgQIuH9xyj5coySJJxO9ymEsVJsAyrR1B3x0Xh8f2SCZ0gBvfV6JVb
         YWJg==
X-Gm-Message-State: APjAAAV7T0ERcvQghv37lblMRVPJ/G7VeySI3qUSCaAqBLZPp0mcGN0i
        fQ5Vn4Z1h2CIB9zy5VdnVJ4=
X-Google-Smtp-Source: APXvYqxd+SvRD+xij34ds5Wefq2QoMUwnmH1O7Cuz+Oifi4mcJExLaFEH9KvWL95Bj1jErdjdGqxaQ==
X-Received: by 2002:adf:fd10:: with SMTP id e16mr6455268wrr.17.1568881334522;
        Thu, 19 Sep 2019 01:22:14 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id s1sm11877105wrg.80.2019.09.19.01.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 01:22:13 -0700 (PDT)
Date:   Thu, 19 Sep 2019 10:22:11 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com,
        ckeepax@opensource.cirrus.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v1 8/9] ASoC: samsung: arndale: Add missing OF node
 dereferencing
Message-ID: <20190919082211.GF13195@pi3>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104713eucas1p2ccfa8e9dff2cda9e8f88ac42dda2b680@eucas1p2.samsung.com>
 <20190918104634.15216-9-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-9-s.nawrocki@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 18, 2019 at 12:46:33PM +0200, Sylwester Nawrocki wrote:
> Ensure there is no OF node references kept when the driver is removed/unbound.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/arndale_rt5631.c | 31 ++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)

Wasn't this issue introduced in 5/9? It looks weird to fix it here...

Best regards,
Krzysztof

> 
> diff --git a/sound/soc/samsung/arndale_rt5631.c b/sound/soc/samsung/arndale_rt5631.c
> index 3744c47742b8..d8da313e898a 100644
> --- a/sound/soc/samsung/arndale_rt5631.c
> +++ b/sound/soc/samsung/arndale_rt5631.c
> @@ -132,6 +132,17 @@ static struct snd_soc_card arndale_wm1811 = {
>  	.num_links = ARRAY_SIZE(arndale_wm1811_dai),
>  };
>  
> +static void arndale_put_of_nodes(struct snd_soc_card *card)
> +{
> +	struct snd_soc_dai_link *dai_link;
> +	int i;
> +
> +	for_each_card_prelinks(card, i, dai_link) {
> +		of_node_put(dai_link->cpus->of_node);
> +		of_node_put(dai_link->codecs->of_node);
> +	}
> +}
> +
>  static int arndale_audio_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> @@ -156,16 +167,31 @@ static int arndale_audio_probe(struct platform_device *pdev)
>  	if (!dai_link->codecs->of_node) {
>  		dev_err(&pdev->dev,
>  			"Property 'samsung,audio-codec' missing or invalid\n");
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto err_put_of_nodes;
>  	}
>  
>  	ret = devm_snd_soc_register_card(card->dev, card);
> -	if (ret)
> +	if (ret) {
>  		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n", ret);
> +		goto err_put_of_nodes;
> +	}
>  
> +	return 0;
> +
> +err_put_of_nodes:
> +	arndale_put_of_nodes(card);
>  	return ret;
>  }
>  
> +static int arndale_audio_remove(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card = platform_get_drvdata(pdev);
> +
> +	arndale_put_of_nodes(card);
> +	return 0;
> +}
> +
>  static const struct of_device_id arndale_audio_of_match[] __maybe_unused = {
>  	{ .compatible = "samsung,arndale-rt5631",  .data = &arndale_rt5631 },
>  	{ .compatible = "samsung,arndale-alc5631", .data = &arndale_rt5631 },
> @@ -181,6 +207,7 @@ static struct platform_driver arndale_audio_driver = {
>  		.of_match_table = arndale_audio_of_match,
>  	},
>  	.probe = arndale_audio_probe,
> +	.remove = arndale_audio_remove,
>  };
>  
>  module_platform_driver(arndale_audio_driver);
> -- 
> 2.17.1
> 
