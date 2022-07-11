Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B42E3566637
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  5 Jul 2022 11:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbiGEJdW (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 5 Jul 2022 05:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiGEJdV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 05:33:21 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55DDF1AD
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Jul 2022 02:33:18 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id t25so19561671lfg.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2022 02:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yzfP/lbnZ03H0j9vVtb9A0tPicYwAQrUmnwfp/loKHw=;
        b=ZOIMt23f6Ag/+weSlpQFCEQcsu2IFtieWj3iKBkDh1rPGdNLQvdvdutGW5RHTRhDIB
         LwnzP7O64wgm+ITODYjdvsDzOqa/Ol42WVzWloMSvoKOaUNZhSCZcMfrF5Dvs8x+bcgN
         OkKOn117XIFKF2TmmvLDccTeGH3VYfZ49vqwtvpsREbccTdt+e4aRajVdIzIapj71fcW
         m9fZ2pr1axyzjOo5Qfjv1mC14GCh3WXYNP0pxrEdr6jautoFW785zp5hc3xnGX2isPXw
         RfElRpgCpWu1pfl6sKQhIyrNW1lrW4zZUdtfO9vBeXgusfGFlIFG1SesMypypsDvl8xf
         CQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yzfP/lbnZ03H0j9vVtb9A0tPicYwAQrUmnwfp/loKHw=;
        b=ZUtoKXJXjwnGR/Vjwq3V/Ty1XOugwpZS7FXm4Ui5pyzYB2GkbQxXI7Nfg2vI1QAiSR
         D6hWGXhI9SD4TZr0cDGQwLAShwmlQHA577mHHEqlS6W+hDBaKe03rmQQ51pxtANiFjip
         9bfmXqjjOjeJ7zuNEDgBLzXJQPF0IpN4k0AUAoJjV5AcWVmLkub+e/YpoYAOzOdKBOAQ
         J3gwjkc1FXRCKsKjHBUUUmnalB4rFlfHt9Knmjj3iJNl+xv15JMO/DS+uSZTm9Yu8fPm
         Lmpc5GImbCjO0XKOv78e7HeLIn8PQ71hrA+tfqI/PvGx0sPZJtoBAgFXulDTv/ASh42+
         8AKw==
X-Gm-Message-State: AJIora+Lq5TP6R+ZVy17k0kWDkHC5F1j9Y1SlVbY0sI+zAbQPSPeO4Fb
        CjgURw+StbR4yYUAs/6p4uPUKw==
X-Google-Smtp-Source: AGRyM1vxnkUSDiWxBI+uKP8agxowY1mJtD6LNtIkhsrjovzczkpcL/6rBXczfAQWWPAnn59xwqEgVw==
X-Received: by 2002:a05:6512:529:b0:483:535b:dc28 with SMTP id o9-20020a056512052900b00483535bdc28mr1946916lfc.540.1657013596716;
        Tue, 05 Jul 2022 02:33:16 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id z7-20020a2e3507000000b0025a7f1065fdsm5250994ljz.107.2022.07.05.02.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 02:33:16 -0700 (PDT)
Message-ID: <f025408a-822d-328b-2c45-206729ebbd91@linaro.org>
Date:   Tue, 5 Jul 2022 11:33:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] phy: samsung-ufs: ufs: change phy on/off control
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>
Cc:     linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20220705065440.117864-1-chanho61.park@samsung.com>
 <CGME20220705065722epcas2p1e93a8511b906d5e111bff48a312d0603@epcas2p1.samsung.com>
 <20220705065440.117864-3-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705065440.117864-3-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/07/2022 08:54, Chanho Park wrote:
> The sequence of controlling ufs phy block should be below:
> 
> 1) Power On
>  - Turn off pmu isolation
>  - Clock enable
> 2) Power Off
>  - Clock disable
>  - Turn on pmu isolation
> 

Makes sense.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
