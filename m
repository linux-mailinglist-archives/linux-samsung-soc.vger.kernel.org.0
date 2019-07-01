Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B989F57990
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 27 Jun 2019 04:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbfF0CeT (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 26 Jun 2019 22:34:19 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45876 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727221AbfF0CeA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Jun 2019 22:34:00 -0400
Received: by mail-lj1-f193.google.com with SMTP id m23so617845lje.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jun 2019 19:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Q52VmEfyzODDUjexrWxHmYGjGvFn+xuEHsx+LScKSTg=;
        b=bVK5unloG/mSghdXaDDGNyMd521dXDj5UMzHvjjJjLf/fGTyHkQ6Me7+chzBNGypQG
         ZWVL2Ht1gXRiciWwYohLBjDpSGIzLL7d5C59BfjKNcldb7/ENjzQMF0HIQmMbTUEjdOA
         kmrviGPuSb5hYjextJKmqZAPKs1oP78bkkJYdHnk9wJOSAJkY4ayFh4lI4SbGm6DOJ6o
         biPJZ7aUZFbsloDbPJTwSAkD6ZrJ7kpseRCSjRK1Z4tDkFueMLNj7c0YAQhYzXrw8jTU
         7nvUw/gztvfeALt7C9fwze3nUy85yQrCmTHRZY7+kMo3GKyoom+xADxtrSehx4Jaavne
         ynZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Q52VmEfyzODDUjexrWxHmYGjGvFn+xuEHsx+LScKSTg=;
        b=mmSaR38gTs80XRkNRQkyEehGloic9C3M2P2q3MbnTo/mqNhiA8jZIVjCG6RSYW6A+K
         7SvorqV5EXu5KIWqwUWb2F1Mc+wsKEV8tEZ6Vfp1847nJKjPIO3uLRCjVkd3ieOcWtWZ
         lcDA5sRlpi3dwcTq4ssUQE6qMuxgezad3WpTAyiTDMntp5vBTE03iSGlDFTFcQncmlXx
         Yu372mW6wRJcfrvxdvSTsXq1PdMxiK6sscmKQjiHsRLddW05hMVIfMptlBfvQjzrfRkW
         hj+Fkz8voFYi0fFWJq+Z1X/kmFyp1emtmEgujzxdPFUTmmEUHKwcGOTZxBEUYN5orstZ
         XTZA==
X-Gm-Message-State: APjAAAXE3DuocYnzF0J+VH0A6CqAYUvO0fLs5ObpYmAbFpy9oDfF4J80
        +fd2jpDcZJ0bhBVhctGlR3i4yg==
X-Google-Smtp-Source: APXvYqyj92gPoEoAWjZ93sFwLUMCNj7Ql/zysxuhQK9eStj8fDbV1Uye+s1koXqor7RwDwo9j6dfVQ==
X-Received: by 2002:a2e:5c09:: with SMTP id q9mr898785ljb.120.1561602838511;
        Wed, 26 Jun 2019 19:33:58 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id v15sm107830lfd.53.2019.06.26.19.33.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2019 19:33:57 -0700 (PDT)
Date:   Wed, 26 Jun 2019 19:27:48 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, arm@kernel.org,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL 1/4] ARM: defconfig: Samsung/Exynos for v5.3
Message-ID: <20190627022748.327vqldfpfykpww5@localhost>
References: <20190625193451.7696-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625193451.7696-1-krzk@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Jun 25, 2019 at 09:34:48PM +0200, Krzysztof Kozlowski wrote:
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-5.3
> 
> for you to fetch changes up to dd50a69b5697532666023766688c6ea642e5a443:
> 
>   ARM: exynos_defconfig: Enable Panfrost and Lima drivers (2019-06-19 19:23:35 +0200)
> 
> ----------------------------------------------------------------
> Samsung defconfig changes for v5.3
> 
> 1. Trim several configs with savedefconfig.
> 2. Enable Lima and Panfrost drivers for Mali GPU.
> 
> ----------------------------------------------------------------
> Krzysztof Kozlowski (4):
>       ARM: exynos_defconfig: Trim and reorganize with savedefconfig
>       ARM: defconfig: samsung: Cleanup with savedefconfig
>       ARM: multi_v7_defconfig: Enable Panfrost and Lima drivers
>       ARM: exynos_defconfig: Enable Panfrost and Lima drivers


Merged, thanks!


-Olof
