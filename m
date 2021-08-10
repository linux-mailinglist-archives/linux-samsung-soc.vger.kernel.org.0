Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 420043DBDA0
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 30 Jul 2021 19:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbhG3RVj (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 30 Jul 2021 13:21:39 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:56110
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230200AbhG3RVj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 13:21:39 -0400
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 458003F230
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jul 2021 17:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627665693;
        bh=o5z17HicOMnibSKxbfutUtdmQTlkkNRFgUGIEJq9A5o=;
        h=From:To:Cc:References:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=iP1hWkWZT5MwdLvttmMex0l/IDza+w9yJmXaClovbGuDZQk3A2vKh1UBx7N6XEXUf
         GNXXL8D5F3rXZ5Gk+bybOiO4/AKiZ7BIjrf5nXR6f/srdiMQJrjD9ug4gTS6YHKUel
         ZAj8ig1/r+6/u6DxOfF5AWYwJ7EZ2kdNKbLo5orIKO84lDxlBO6O/uitwevsCqDyXt
         KSvAX6pY3v035Z1khVp0+xT81wAuBHXccX256pOfkSlKBKQItACijOQLvezemEmR2e
         acouAcnqVlz5aWFP0O0Kz/JaVgqa2l5eApzLQ07eyR6uNpREj44eMVSq34ifNmACXo
         xIKWVdmtXeorQ==
Received: by mail-ej1-f70.google.com with SMTP id q19-20020a170906b293b029058a1e75c819so3316880ejz.16
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jul 2021 10:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=o5z17HicOMnibSKxbfutUtdmQTlkkNRFgUGIEJq9A5o=;
        b=FoWC60T8Z7bvX81quWkr1Wdb44cT92nehnK56ura+UeyyBbSyQ46TtC8jfN+osAZWu
         FQYkEsjSyqf1Xae10a7n/rE15ah6J4+dG1t7n/KSTOY0jifr0mff4rg0e8djJ40HMoLW
         VkzKPw2xrEtJmdq/8wYfH1mHnMXoooxEUyTFKoCvDh8189NsH3AsmL1voRGJrWQNe2bu
         NkyWNb/sX5n0Lf7s6j88ZceJMe1AbxBCorQDf35rfBtU5ME5qUb0syfG5Nii5tCR2QM5
         5VKVNKtDY51RlnXu0xTE1B+fS9fuNxtR+V6y57c99r6xyJHog0Ui/jkFzb6b+M+V2+Ka
         TdGQ==
X-Gm-Message-State: AOAM531IpFIj4vq0QwYsNZgavsFI1bAZIaKt8hmUZSuR+nKn72WipNHy
        A6QwNZOhlh3gy52o209CF4ugRQu/JEyZ9ftPIAEEsQYdL7XCe+xxRFIvPbTCE3GFqwhE7TLxyGA
        QH/nxEj1Bnqm2wHHo+EOvZHScxKWH+aPYuDtn5pRwKJnYcudv
X-Received: by 2002:a17:907:724b:: with SMTP id ds11mr3758097ejc.192.1627665692502;
        Fri, 30 Jul 2021 10:21:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFiKJlif1uhqb84VdmehIjJr5DEUQdSGnnvL110bm0Y0Y4Awj/aQgY4XpZWPb/ITBePmMBnw==
X-Received: by 2002:a17:907:724b:: with SMTP id ds11mr3758080ejc.192.1627665692316;
        Fri, 30 Jul 2021 10:21:32 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id p16sm944758eds.73.2021.07.30.10.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 10:21:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <5e35b0a7-13aa-3c62-ca49-14af2fcb2a08@canonical.com>
Subject: Re: [PATCH 00/12] Add minimal support for Exynos850 SoC
Message-ID: <c3486111-0ec9-9679-d2a2-68b2f33a2450@canonical.com>
Date:   Fri, 30 Jul 2021 19:21:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5e35b0a7-13aa-3c62-ca49-14af2fcb2a08@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 30/07/2021 17:18, Krzysztof Kozlowski wrote:
> On 30/07/2021 16:49, Sam Protsenko wrote:
>> This patch series adds initial platform support for Samsung Exynos850
>> SoC [1]. With this patchset it's possible to run the kernel with BusyBox
>> rootfs as a RAM disk. More advanced platform support (like MMC driver
>> additions) will be added later. The idea is to keep the first submission
>> minimal to ease the review, and then build up on top of that.
>>
>> [1] https://www.samsung.com/semiconductor/minisite/exynos/products/mobileprocessor/exynos-850/
>>
> 
> Great work!
> 
> What's the SoC revision number (should be accessible via
> /sys/bus/soc/devices/soc0/)? Recent wrap in numbering of Exynos chips
> might bring confusion...

Judging by vendor's sources it is quite confusing. It looks mostly like
Exynos3830 but in few other cases it uses Exynos9 compatibles (Exynos9,
Exynos9820). Only in few places there is Exynos850. Marketing department
made it so confusing...  The revision embedded in SoC would be very
interesting.

Anyway, judging by current versioning, there is a risk Samsung will come
with a new chipset name conflicting with existing ones. It already
overflowed.

It's even worse with a thingy called "Exynos9 auto" which hides
numbering even more.


Best regards,
Krzysztof
