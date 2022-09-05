Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE7EE5AD241
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  5 Sep 2022 14:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237142AbiIEMTk (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 5 Sep 2022 08:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236787AbiIEMTj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Sep 2022 08:19:39 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E1B10559
        for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Sep 2022 05:19:37 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id j14so12910895lfu.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Sep 2022 05:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=uLFVpwL+K/8vBnNeBIqD0bnrQNEYXNCQ5ZcTV6tt8XM=;
        b=hK++AwSCUxbN7mrDFyZRX00NUn64ZmAiOC0t5xoHUHmoxe5RHqUkf7s1eKGVhmBiuz
         CQcn0+IA58FhN8s2ikMh9JZn+EcGE8wpuqOd6ykCJPSqt+TNn51Jvtelknb8N1WI8N2F
         3mWkITa908J5+inow3THMOho82pSlwVNhSrgw/CLSVbgvxQ56FiWs/261AkXCqV9cLfK
         J966quCXJp66ooFrmn7p0qzgO7hBXWiA6RLfRSn1he/bPTQ6j3s0I3SyvS4NXyimJhsi
         msjG9n6NjJh6pKI78hb/+LBiXCQR+cDaBYD0mtS6MaTqWm2GvbfhhSCt7f+bfQpq3r5r
         L4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=uLFVpwL+K/8vBnNeBIqD0bnrQNEYXNCQ5ZcTV6tt8XM=;
        b=18MT8Icy85DynWN8w2pllKe6WMUlzp8uy727E5vIYyd5efI9qZLvHlebw74YQDBcCH
         OKLzkhWmhaxckH3GNguj+rC/Bcu+kyxN/ixhvvA/Vm6dSIu0oPGyyH1uWZYo6nfG03u6
         3iqkfiHFiVSVPxteUT/RKpaSPOEViZhX6VTPYgwaSM4X9AgecKjsicG7F7NyPhEnqPBM
         /sl/+RbiceDYhfcHUVR8oNvJIWq9vnOyyI9m+jOf9Oi9zVXH8cIgsgPLld/t55+Vpc8v
         N5pW+JfZLFcoFK+KsfcPvwdIbnwf8h7MhxCp2Re5+MW2VvFfI4L0tBKOO/NtboNzfcC4
         1OUg==
X-Gm-Message-State: ACgBeo3eK0+YYmmE2j6pgPOV9GIfwT5He1xXBdM/62+NELscWLX4RxsB
        NL565NbQM6vs48jUW01F+1l4nw==
X-Google-Smtp-Source: AA6agR4RCsw6lJqZwkMUyrOduj4LVzpdXzKpmlnuDVQpKdfbxaMEs17Ol01jmNf43r01HjyYoMjDcw==
X-Received: by 2002:a05:6512:33c8:b0:48a:fe63:e4ea with SMTP id d8-20020a05651233c800b0048afe63e4eamr15484628lfg.415.1662380376296;
        Mon, 05 Sep 2022 05:19:36 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b23-20020ac25637000000b00494a27500c1sm1173634lff.163.2022.09.05.05.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 05:19:35 -0700 (PDT)
Message-ID: <64e96f32-e3c4-5a9d-c4f0-90986eba597d@linaro.org>
Date:   Mon, 5 Sep 2022 14:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] USB/ARM: Switch S3C2410 UDC to GPIO descriptors
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20220901081649.564348-1-linus.walleij@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901081649.564348-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 01/09/2022 10:16, Linus Walleij wrote:
> This converts the S3C2410 UDC USB device controller to use
> GPIO descriptor tables and modern GPIO.
> 
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> If the Samsung S3C maintainers can ACK this I think it's
> best to take it into the USB tree where the bigger changes
> are.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
