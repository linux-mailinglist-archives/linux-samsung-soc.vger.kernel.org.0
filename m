Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA9C0688D9A
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  3 Feb 2023 03:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232152AbjBCC7l (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 2 Feb 2023 21:59:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjBCC7k (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Feb 2023 21:59:40 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D992119F32
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Feb 2023 18:59:38 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id gr7so11760751ejb.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Feb 2023 18:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fBZRXwv5EC0srRDal6IgJ95Rn667hJg55SC5Acu1s8s=;
        b=Yq/hwfpiFs1LQ9ywcVHMT3+I5DFDrksNUyywxOYdfJQFNBKRm85XB+wSfI6IOJxqpl
         tQyuwZvAJFIgQsMZGu12Db659GsI3PZAowSdPSLA1apZyexMInR0cl8p3AElDouluLDv
         WWZWXTyQ/TSCDUgd5GVpNvRjqnMzyzJS20wOVWXLESH1OKgpoTVLTuoBZY4gjfMPF8Rq
         EmzTFrRKxB+3Wvm/VKTDFeCEJzG2VSxlT/knzXQY4VDSuWEHcgWwefsxYjGxEuKoko+A
         6pcdjNnrsXaxocaUDn1AO+nUVJ818geexhhpJGXkJVRkb6wNSzIqN46k9D9NNNGR7Etx
         V/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fBZRXwv5EC0srRDal6IgJ95Rn667hJg55SC5Acu1s8s=;
        b=mFt+aycNkskL5ZA17XPmsqrGbjJs1JiDygZ7HRHfSXa7ckWGuQsl4ktDzVda/5qNN3
         jm8O0QJ7z7YT1emen+S8WZbEuYDs8cCQ3kgZUjXmLKHBaLT9rQD+ecAbwxx+i04JdrA/
         I8tqlPkLqXpsiQHu3U7l/Hhg/OLA0mxc6viQ/xLuNFeexQvqK5VY7q78P3BeNvjMa09m
         WIB0iJTpK10vEFdud0/g7IeaEFGn2ZAbM+uqJesjufX3zMm8xWhGUs3z7Z2SkTMbv3Oz
         PAIhJU+ejhWpRH9ryZuqwbD0BKeHIsbkwY0AYomTr8nsW8ko6dSStFyVq5NhiSShjxFL
         UUHw==
X-Gm-Message-State: AO0yUKUu5f7YXIWz+qd8WOyhrMawXN/VLs3cJtSNhxHwGDai7a6M8tm3
        KAi+jJkfWAxl1fHnxJMJucoXiw==
X-Google-Smtp-Source: AK7set+bT60wmwsIelvVGF4y/w5GhrY88VkA7jjz6d++JvsPPx3FkeutGTgt+6+xKe0aMwWaoXKraQ==
X-Received: by 2002:a17:906:6d14:b0:88d:5081:e9f8 with SMTP id m20-20020a1709066d1400b0088d5081e9f8mr8648879ejr.15.1675393177375;
        Thu, 02 Feb 2023 18:59:37 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id s19-20020a1709067b9300b008878909859bsm664237ejo.152.2023.02.02.18.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 18:59:37 -0800 (PST)
Message-ID: <b314c3bb-6d07-b781-c878-a22aa321a8ed@linaro.org>
Date:   Fri, 3 Feb 2023 03:59:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 22/23] interconnect: drop unused icc_get() interface
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230201101559.15529-1-johan+linaro@kernel.org>
 <20230201101559.15529-23-johan+linaro@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230201101559.15529-23-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



On 1.02.2023 11:15, Johan Hovold wrote:
> The icc_get() interface can be used to lookup an interconnect path based
> on global node ids. There has never been any users of this interface and
> all lookups are currently done from the devicetree.
> 
> Remove the unused icc_get() interface.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/interconnect/core.c  | 52 ++----------------------------------
>  include/linux/interconnect.h |  8 ------
>  2 files changed, 2 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
> index b8917823fd95..8cca5e9a9d5f 100644
> --- a/drivers/interconnect/core.c
> +++ b/drivers/interconnect/core.c
> @@ -588,7 +588,7 @@ EXPORT_SYMBOL_GPL(icc_set_tag);
>  
>  /**
>   * icc_get_name() - Get name of the icc path
> - * @path: reference to the path returned by icc_get()
> + * @path: interconnect path
>   *
>   * This function is used by an interconnect consumer to get the name of the icc
>   * path.
> @@ -606,7 +606,7 @@ EXPORT_SYMBOL_GPL(icc_get_name);
>  
>  /**
>   * icc_set_bw() - set bandwidth constraints on an interconnect path
> - * @path: reference to the path returned by icc_get()
> + * @path: interconnect path
>   * @avg_bw: average bandwidth in kilobytes per second
>   * @peak_bw: peak bandwidth in kilobytes per second
>   *
> @@ -705,54 +705,6 @@ int icc_disable(struct icc_path *path)
>  }
>  EXPORT_SYMBOL_GPL(icc_disable);
>  
> -/**
> - * icc_get() - return a handle for path between two endpoints
> - * @dev: the device requesting the path
> - * @src_id: source device port id
> - * @dst_id: destination device port id
> - *
> - * This function will search for a path between two endpoints and return an
> - * icc_path handle on success. Use icc_put() to release
> - * constraints when they are not needed anymore.
> - * If the interconnect API is disabled, NULL is returned and the consumer
> - * drivers will still build. Drivers are free to handle this specifically,
> - * but they don't have to.
> - *
> - * Return: icc_path pointer on success, ERR_PTR() on error or NULL if the
> - * interconnect API is disabled.
> - */
> -struct icc_path *icc_get(struct device *dev, const int src_id, const int dst_id)
> -{
> -	struct icc_node *src, *dst;
> -	struct icc_path *path = ERR_PTR(-EPROBE_DEFER);
> -
> -	mutex_lock(&icc_lock);
> -
> -	src = node_find(src_id);
> -	if (!src)
> -		goto out;
> -
> -	dst = node_find(dst_id);
> -	if (!dst)
> -		goto out;
> -
> -	path = path_find(dev, src, dst);
> -	if (IS_ERR(path)) {
> -		dev_err(dev, "%s: invalid path=%ld\n", __func__, PTR_ERR(path));
> -		goto out;
> -	}
> -
> -	path->name = kasprintf(GFP_KERNEL, "%s-%s", src->name, dst->name);
> -	if (!path->name) {
> -		kfree(path);
> -		path = ERR_PTR(-ENOMEM);
> -	}
> -out:
> -	mutex_unlock(&icc_lock);
> -	return path;
> -}
> -EXPORT_SYMBOL_GPL(icc_get);
> -
>  /**
>   * icc_put() - release the reference to the icc_path
>   * @path: interconnect path
> diff --git a/include/linux/interconnect.h b/include/linux/interconnect.h
> index 2b0e784ba771..97ac253df62c 100644
> --- a/include/linux/interconnect.h
> +++ b/include/linux/interconnect.h
> @@ -40,8 +40,6 @@ struct icc_bulk_data {
>  
>  #if IS_ENABLED(CONFIG_INTERCONNECT)
>  
> -struct icc_path *icc_get(struct device *dev, const int src_id,
> -			 const int dst_id);
>  struct icc_path *of_icc_get(struct device *dev, const char *name);
>  struct icc_path *devm_of_icc_get(struct device *dev, const char *name);
>  int devm_of_icc_bulk_get(struct device *dev, int num_paths, struct icc_bulk_data *paths);
> @@ -61,12 +59,6 @@ void icc_bulk_disable(int num_paths, const struct icc_bulk_data *paths);
>  
>  #else
>  
> -static inline struct icc_path *icc_get(struct device *dev, const int src_id,
> -				       const int dst_id)
> -{
> -	return NULL;
> -}
> -
>  static inline struct icc_path *of_icc_get(struct device *dev,
>  					  const char *name)
>  {
