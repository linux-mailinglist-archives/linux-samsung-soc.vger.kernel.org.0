Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 730004D41A4
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 10 Mar 2022 08:14:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239727AbiCJHPw (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 10 Mar 2022 02:15:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239707AbiCJHPw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 02:15:52 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B23CFBAD
        for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Mar 2022 23:14:50 -0800 (PST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 863B53F60F
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Mar 2022 07:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646896489;
        bh=3lq+YZlfctpY1z6cHd0Yn3IlZgGEVfZmuX5LYYiOwRA=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=pjGP2fIqt6La/p22Pkb8uLafiOe4OGKXZ+SA3tiapwI/P3OpaF+wu1j39dhmaKlB5
         nsrumuSeV2GjjDzPh2vpv/gf/3sYLJQKNQUyRg2ribubpkAIn6YapEfcPA5SRhXyfR
         sScohck0ZggotxM/XOwd8DjFLi2Q1ZCG1Cwt9udyPDqB9W5kqnaOG8U//S3NZTBAO3
         1ZQLtq77kJiFiqd3y9iLJbGsfQsO/hgNtEGTqLq8x+wIBrZZaATEkbfwRvcBSjWjaT
         73zADC/w1ZKCUI81QTAYGBsvBTxfS9kX/07kr3HjnNAl37xDcrwQFMDRg2yDYDtavl
         32C1uaoNhlcDQ==
Received: by mail-ej1-f69.google.com with SMTP id og24-20020a1709071dd800b006dab87bec4fso2639812ejc.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Mar 2022 23:14:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3lq+YZlfctpY1z6cHd0Yn3IlZgGEVfZmuX5LYYiOwRA=;
        b=FDQKOHRu5GNbG5T4sh0LgYp+/wFSMqzFai5n8UOlN23fK0U2fm0E6aG53vr5Wg2zsw
         E2fxKPBfsgGFDqXnID1o65vNNkLXFbs7UcPinWcaG2Zz/jQE6a1dFANzU5PVu5t1LNZ2
         76yyLzYP1PYrKudw5NDvOjfpEQnTkR7px24A+eZjf/vLwTzW6FywmVwxhHcYlxEcUkGp
         5hs4oNBDKuGd9cbf7GSSsVwQimMupnCUVFsBXj6OP+4iBgGE/2NN6jA3FYQ1I9Z0k2sb
         u6BwJVFMBaAy/xEh+ie/F9gIowrsc3ADmYIRfoiDPaVE3+qBzAWgQYwFb9hP6pwLZb6u
         PNmg==
X-Gm-Message-State: AOAM531r9RcOL+Uwn9xrW0KPbpVfZKwZaGMSB5xuqFkC9mAtQFstPdTI
        hewpNIhJ1aeU47rXx/iXVFVG31rdXABvVC2BdknXV4uR/eZx0e6JeA6Ficrn+F3RON02zc96INK
        iVbBOUYbJGe8p2lrEA3AX3AbwPvCAIJHZutEQgeU8ILV3H7I7
X-Received: by 2002:a17:907:6d1d:b0:6cf:3fa:4d80 with SMTP id sa29-20020a1709076d1d00b006cf03fa4d80mr2904084ejc.544.1646896489028;
        Wed, 09 Mar 2022 23:14:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnwsw6g5oiyOOkT6oGQB0u27Xh3SNk1CQGJAFJtCdISidk+n7aFZeumpAEYylkhSZcU/i4kQ==
X-Received: by 2002:a17:907:6d1d:b0:6cf:3fa:4d80 with SMTP id sa29-20020a1709076d1d00b006cf03fa4d80mr2904065ejc.544.1646896488861;
        Wed, 09 Mar 2022 23:14:48 -0800 (PST)
Received: from [192.168.0.144] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id h24-20020a170906261800b006da94c9ccc9sm1479713ejc.129.2022.03.09.23.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 23:14:48 -0800 (PST)
Message-ID: <12c31919-c393-8c54-7618-ea767c82470b@canonical.com>
Date:   Thu, 10 Mar 2022 08:14:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] dt-bindings: thermal: Add artpec8 compatible string
 for exynos-thermal
Content-Language: en-US
To:     hypmean.kim@samsung.com, "bzolnier@gmail.com" <bzolnier@gmail.com>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "amitk@kernel.org" <amitk@kernel.org>,
        "rui.zhang@intel.com" <rui.zhang@intel.com>
Cc:     "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CGME20220310013129epcas3p1110cbdfbd3d72ade45b8d98433ca0aac@epcms2p8>
 <20220310015655epcms2p843397a4c9e6707f1e862b2d00751d8f6@epcms2p8>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220310015655epcms2p843397a4c9e6707f1e862b2d00751d8f6@epcms2p8>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/03/2022 02:56, Sang Min Kim wrote:
>  
> Extend the exynos-thermal dt bindings document to include compatible
> string supporting artpec8 SoC.

Your formatting is wrong, but at least this is not HTML...

s/compatible string supporting artpec8/compatible for Artpec-8 SoC/


Best regards,
Krzysztof
