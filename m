Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C87BF4C5A76
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 27 Feb 2022 11:24:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbiB0KYx (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 27 Feb 2022 05:24:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiB0KYx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 27 Feb 2022 05:24:53 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A0BD1E3CA
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Feb 2022 02:24:17 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C9CCD3F32C
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Feb 2022 10:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645957455;
        bh=gFalKRe8JlGPelOo/R9VR3IL4dqyePAFZHwDnlwRlEk=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=jLh60SiGk1ssq7pESJe+eHLauvQRxegd9y4n5MepDLsTf7G/se5F+ZvJjBpVEqCwq
         BJ+7tkFSX2/JdS269FU8Rew781ru9i2ukSQ4xvFh4E8P60jMfRGKP7jzWfJlIMxRuR
         ii1hm9g3VUt7JlkDpPO131VuAngiQm3AxZFagFCPQEtytZ2/w+XVTfLrm8iVIVg4UV
         AmF4Y0irG+GRFZ62ZmZEYo8j2SmOuvoXfKALFGhnyChSoTN5oabPb9HOmmAEQvF+no
         FZ/d5p8OxpWn101hA6z+VI7nJvALatzHaYo6AOQs4ZvUjyJb/gVK2eCnHROsx0QCYJ
         A7emELjVLb5QQ==
Received: by mail-ed1-f71.google.com with SMTP id j10-20020a05640211ca00b004090fd8a936so4045590edw.23
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Feb 2022 02:24:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gFalKRe8JlGPelOo/R9VR3IL4dqyePAFZHwDnlwRlEk=;
        b=N4o5DICw1cr1ImLh0Q//01RBKamPDBkQXAkKSYVrmT8Cob0NCOiP2z0qzpSIdD3gwP
         uHc1NSCuaVYQf7wyA4q304c2WYtDUVwuVTUhN4mLTr8a5cmrqI0o5MGQr21GpNOMFXl0
         gjVuB6VVvV3YRJdNBD5N67z64ijVhldTXVm5OKgvHFFd1IIWdEbOcKZ2esdyU3nFXf8J
         vwg3OsSoaycBBg260rlWcHBubMfk1CWw6L+FfncFN6zh9ID6w5LpFqFPIF0xB//TY4Sx
         LXLbiPDGPs8LT02uRT4ljdxEe8vsQIR51MuwuGLpo0u3fDjkX2ZD13cxNbbTK9Esys3l
         9JAA==
X-Gm-Message-State: AOAM531FXRtwSGtetZ9M58qAtUBV9CAPyTxQnWELt4uEyu4lSM95FbBZ
        5fiVU8ZPoOceWaJdxh1GPQMyYtmIxHJDsJyaqQ/F2lXmYrgBcT+MxXV3Rzc/OoCeDhuqC1oJP/l
        nJbIBiF/2ndA76LlnGzaz8oODFc9UrsFzRXcx5l/28Q3H3e4v
X-Received: by 2002:a17:906:d968:b0:6d0:fc05:bdc3 with SMTP id rp8-20020a170906d96800b006d0fc05bdc3mr11342160ejb.719.1645957455521;
        Sun, 27 Feb 2022 02:24:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwl3Y8M/TgNxwE3/0YwpdpPk65xBu71Ro8HLF5s9NgyHBBUg649P8bP26tAeg/OT/XsQvSm8w==
X-Received: by 2002:a17:906:d968:b0:6d0:fc05:bdc3 with SMTP id rp8-20020a170906d96800b006d0fc05bdc3mr11342141ejb.719.1645957455350;
        Sun, 27 Feb 2022 02:24:15 -0800 (PST)
Received: from [192.168.0.133] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id el9-20020a170907284900b006cf8e3c83e3sm3243768ejc.168.2022.02.27.02.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Feb 2022 02:24:14 -0800 (PST)
Message-ID: <8ba5fb1b-2b5f-e625-0dbe-2acc3b6656e7@canonical.com>
Date:   Sun, 27 Feb 2022 11:24:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 01/15] dt-bindings: ufs: add common platform bindings
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Yaniv Gardi <ygardi@codeaurora.org>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
 <20220222145854.358646-2-krzysztof.kozlowski@canonical.com>
 <YhktWpoJekR2Lj0D@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YhktWpoJekR2Lj0D@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 25/02/2022 20:26, Rob Herring wrote:
> On Tue, Feb 22, 2022 at 03:58:40PM +0100, Krzysztof Kozlowski wrote:
>> Add bindings for common parts (platform) of Universal Flash Storage
>> (UFS) Host Controllers in dtschema format.
>>
>> The 'freq-table-hz' is not correct in dtschema, because '-hz' suffix
>> defines uint32 type, not an array.  Therefore deprecate 'freq-table-hz'
>> and use 'freq-table' instead.
> 
> -hz is an array type. We can extend it to matrix if needed.
> 
> I do think this property is a bit questionable. Do we really need a 
> minimum in DT and if not, wouldn't assigned-clocks-rate work? Or an OPP 
> table.
> 

I think the proper solution is OPP table, see also comments from Bjorn:
https://lore.kernel.org/all/YhUodbzxx4wbr+gy@ripper/

I would rather refrain from converting it to OPP tables, because I won't
be able to test any changes in the driver.


Best regards,
Krzysztof
