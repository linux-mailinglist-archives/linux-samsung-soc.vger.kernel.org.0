Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 684DC3564B5
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Apr 2021 09:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346060AbhDGHDW (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 7 Apr 2021 03:03:22 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59125 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346041AbhDGHDW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Apr 2021 03:03:22 -0400
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lU2DY-0000tW-Ho
        for linux-samsung-soc@vger.kernel.org; Wed, 07 Apr 2021 07:03:12 +0000
Received: by mail-ed1-f72.google.com with SMTP id r6so11644633edh.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Apr 2021 00:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EPPmWmdaq2dh/UGET3fGHk7TqyifSikdBPPTcaMQ1jg=;
        b=HSjDSH2MkR5iz86n3AFPTo8L5oDeB0WD6pzhuaZJni+NSg9hC4KcSyWLE+kGJWkiB7
         rTspgdz0AzNDheblHHhKuwkV9cuEr3mdkF16lsq36WqCSKzfC86DZ1U0qCdjYKv+WK7W
         QO39pyIe7eawyo6BV/dTDh7XswPpzKOBZUc9NanFsmnN0qPIaaw/zUlS5UsW5n29QInB
         ntEFIYTbQfmlRZe06cfBIlLtdJVhJ5no8y+KqXVFwm8StHDw6rTxV7aPUHOI+TKGw/zF
         4/YosHAHmafAh0mQVewVrmBjQfOl8C5QjBj/YMnNxgnOGQRYmzKefmIeku+CZN3tWUsu
         YTjw==
X-Gm-Message-State: AOAM5305ZKidMvW3FFbC/uD/tJwMbXvXtcLiLYi8YUkJEhFsRLia7p5A
        F+qFDE0PCs21WHyKP5UA6v/rrLd8Ggtp/iTfI9gfu0eX1q5VRQBGztT4dt0tRFvtnCY93P8bz0R
        2FaFb3hP6+2kcEXvkBbzhiAYzfTbP/JDhmQPvoEQbmWhtGFb9
X-Received: by 2002:a17:907:8315:: with SMTP id mq21mr1978849ejc.197.1617778992256;
        Wed, 07 Apr 2021 00:03:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5unwAu/pheJs7/Bm4+tsoa6su36QNc2QP3KIySluVf5OYxVWePEgyI1T1vZ5SuhSIJMwiOQ==
X-Received: by 2002:a17:907:8315:: with SMTP id mq21mr1978824ejc.197.1617778992048;
        Wed, 07 Apr 2021 00:03:12 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id s9sm14384640edd.16.2021.04.07.00.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 00:03:11 -0700 (PDT)
Subject: Re: [GIT PULL 1/3] ARM: dts: samsung: Pull for v5.13
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210407065828.7213-1-krzysztof.kozlowski@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <33fb7d93-a091-e1d4-e0e6-463c391b6e76@canonical.com>
Date:   Wed, 7 Apr 2021 09:03:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210407065828.7213-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/04/2021 08:58, Krzysztof Kozlowski wrote:
> From: Krzysztof Kozlowski <krzk@kernel.org>

I still did not update all my tools for new email - this should be
"From" my Canonical address. The tags are signed with the same key with
@canonical.com UID.  The latest key is already in kernel PGP keyring:
https://korg.docs.kernel.org/pgpkeys.html

Best regards,
Krzysztof
