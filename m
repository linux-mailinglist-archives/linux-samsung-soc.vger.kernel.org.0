Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 142B260ADAF
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 24 Oct 2022 16:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236948AbiJXOah (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 24 Oct 2022 10:30:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237181AbiJXO3T (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 10:29:19 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72363D6BBF
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 06:02:59 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id z30so5946769qkz.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 06:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sj4rwP10ivbaDE642zXPeXGYeb0v6Kqa3KmwN/UeLFs=;
        b=ygyV3F3B3SB9mhfxjp4anjK5UNQFKHJJo5IaehlqtAI53Y+yEOQeLL2ZPxnDNkoWY9
         OmKRj7j9XjcmIoqurMww59yTsGJd/fWg0AqLT4vx9OQpsKwTH4wcLB4H+ZW5Bjw6gIKM
         quOpnfFwbVAa1PDBxXdJPS0/6hway+YgPp4WuU6lb8Fe2wGC8BcZlm57qj4LYdZ9SDOC
         BS/MjLbrMtF6Pc0aKP6NMgT8lAK94a5edDivtSRa+j/a02QO6wZ/SVskOmQTawKdpvCG
         SEE5rqE7omBdmZDQvM80mAV9epgnQJh5tgi2EBir//bSXLVIyaQlW1VPiwy0Y1yS6jDZ
         r+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sj4rwP10ivbaDE642zXPeXGYeb0v6Kqa3KmwN/UeLFs=;
        b=WcE+No9nHRbJb4LJBlArM01Y1JTJKVhEft4Idi4phDmrMwBcg2kW8nBPWjQnlwyIY4
         vEzTEbP3U3wYFXZiFqeYY/yOWxsUh796BeH/6L3RqrnJTt9YM4NmqPnPXFqHwaYI+8kX
         lk3FoEt4bq82feiBYlMnbVgInN3Jppap+/wCJD98WeRsQHi2YjT8aeSW16VZoq1U2hix
         MiP3ID7tITpYkg9k74SbesfDMpzFY+pIfWQMOmdrndbfCnNEY0QJPkE4m6DmXx7Zfvdi
         GndhBLGdVXrv8EFLnG5ffXdRx7XkirgULo+vK01+SY26xtkpmhhTkji/Yhi0aKZi8trs
         HvBw==
X-Gm-Message-State: ACrzQf30v92scoC+EmSTuqv2CLasTp93AdYV/eBrEJmvvWZ5YfbPVH0L
        3EiShavdnhG6gBJKe63ZVGOkCO0rxNqbcA==
X-Google-Smtp-Source: AMsMyM7pzk/fyuwTkYEax7kxBeF9PwuIw06aw9bDXVI99J5zmBKOsE3HMgFtSnUxcFMBsHfUk4GpGQ==
X-Received: by 2002:a05:622a:64c:b0:39c:ba62:ef05 with SMTP id a12-20020a05622a064c00b0039cba62ef05mr26908111qtb.351.1666615946883;
        Mon, 24 Oct 2022 05:52:26 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id 134-20020a370a8c000000b006cbcdc6efedsm14682583qkk.41.2022.10.24.05.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:52:26 -0700 (PDT)
Message-ID: <e93a0495-3024-d5a0-cec0-205c210d0c8f@linaro.org>
Date:   Mon, 24 Oct 2022 08:52:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 20/21] soc: s3c: remove pm-debug hack
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        linux-samsung-soc@vger.kernel.org
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-20-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021203329.4143397-20-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/10/2022 16:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> CONFIG_SAMSUNG_PM_DEBUG was only used on s3c24xx because of the
> DEBUG_S3C24XX_UART dependency. Since s3c24xx is now gone, and nobody
> ever noticed this option being missing from s3c64xx, it can be safely
> removed as well.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

