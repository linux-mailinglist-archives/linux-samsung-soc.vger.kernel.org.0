Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9C9C77460F
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  8 Aug 2023 20:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjHHSwc (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 8 Aug 2023 14:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234402AbjHHSwC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 14:52:02 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E7705DBF3
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Aug 2023 10:05:14 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31763b2c5a4so5061946f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Aug 2023 10:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691514312; x=1692119112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7/neN/3MAwPWtJfwm6LVkhUVNl60rPtJxXyh7+fqe70=;
        b=ykySj1P1MXaoDxQ4cSXYxI1MYzTxUbqJB7HEpQYNV6n9qV0yiVf0sFMJZ6EQs17vHA
         P6JJBjZfMYM9Tecz8H6Cu3ZgDYVWUfxj1NJsgFCZoSzkDXe96jxJBobFtHC278tcUIs1
         w0A+VcKcfEhpFPbmMGpxsxZcJcZ8ovwSjlDVDVYEvZInQxNnjIDIVRBoQg6YH/3m+d3P
         6PO/VUOXEaNDezAfwIosq83U8l78qlqF+Ua28hkU5u4Jbm9Lt1KCKzXFFLLOAMHIZotW
         w7DxYkSoF2fJg1tOKlUWP+dbSlqo78bJ0XKAxDRtmV8BWgPtmC8EPtBbF43l7fweiH4J
         C9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691514312; x=1692119112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/neN/3MAwPWtJfwm6LVkhUVNl60rPtJxXyh7+fqe70=;
        b=dpqlECU3VeQfXxT+VrZhNhw1oiAMBZK00JUGuMau+EGvbrrP2JuoD2pGzJWwIAe0V3
         Nc+tT/5zBAX/7INDc9pQjqXb9+/4u2bSj2CwouWDMXmT0GcDRGKEgCWCqylnPluO+nf9
         +DHI6e0dg0QLPsSzdtRRtfog5y7GVS+D9YSYvG7EryOJQGehvONmaw/iHP01Tkllnzuj
         4BpWC03a/IgNdjo8sQYY/yeyztp7UsWzfp4qojV5W74s3kQ1dwvnPvvJjWb5P8x4FvtO
         dJge9hzrgDe6rLX5FXrmIHOBOUk65iYe+NQFB390laJIKdbywmK4hcEiNb0Zikb/LbU+
         RocA==
X-Gm-Message-State: AOJu0Yzi5ZrAHgkKGVTZrgDoRd0I5Oql4v/QMkygY+BM9L2oONrBuQa2
        ye6wcaId4EZraXZ8m9DDw6lMpFkz6aZ3y1Eep8A=
X-Google-Smtp-Source: AGHT+IEhz/h88VbIK+Uxv8RtvehzJEb4HtJYyKbQA5Ljg8jQq5fhiYybRtK6Z0XyqhDAHfl5BtRxaw==
X-Received: by 2002:a17:906:ca:b0:994:47a5:a377 with SMTP id 10-20020a17090600ca00b0099447a5a377mr10240779eji.24.1691475723704;
        Mon, 07 Aug 2023 23:22:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id bw5-20020a170906c1c500b00988f168811bsm6194300ejb.135.2023.08.07.23.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 23:22:03 -0700 (PDT)
Message-ID: <84fbcc37-d226-b637-caa1-b24ebaf03d58@linaro.org>
Date:   Tue, 8 Aug 2023 08:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 3/3] media: exynos4-is: fimc-is: replace duplicate pmu
 node with phandle
Content-Language: en-US
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230807131256.254243-1-krzysztof.kozlowski@linaro.org>
 <20230807131256.254243-3-krzysztof.kozlowski@linaro.org>
 <20230807231320.svssge6uymw3jiho@intel.intel>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230807231320.svssge6uymw3jiho@intel.intel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/08/2023 01:13, Andi Shyti wrote:
> Hi Krzysztof,
> 
> [...]
> 
>> +static void __iomem *fimc_is_get_pmu_regs(struct device *dev)
>> +{
>> +	struct device_node *node;
>> +	void __iomem *regs;
>> +
>> +	node = of_parse_phandle(dev->of_node, "samsung,pmu-syscon", 0);
>> +	if (!node) {
>> +		dev_warn(dev, "Finding PMU node via deprecated method, update your DTB\n");
>> +		node = of_get_child_by_name(dev->of_node, "pmu");
>> +		if (!node)
>> +			return IOMEM_ERR_PTR(-ENODEV);
> 
> in my opinion this should be:
> 
> 		...
> 		if (!node)
> 			return IOMEM_ERR_PTR(-ENODEV);
> 
> 		dev_warn(dev, "Finding PMU node via deprecated method, update your DTB\n");
> 
> Because if you don't have both "samsung,pmu-syscon and "pmu" then
> the warning should not be printed and you need to return -ENODEV.

Why not? Warning is correct - the driver is trying to find, thus
continuous tense "Finding", PMU node via old method.

> 
> ... and... "*please* update your DTB", the user might get upset
> and out of sheer spite, decides not to do it – just because! :)

The message is already long enough, why making it longer? Anyone who
ships DTS outside of Linux kernel is doomed anyway...

Best regards,
Krzysztof

