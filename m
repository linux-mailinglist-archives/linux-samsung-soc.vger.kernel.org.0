Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF3EBB136
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 23 Sep 2019 11:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731817AbfIWJRx (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 23 Sep 2019 05:17:53 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39805 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727358AbfIWJRx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 05:17:53 -0400
Received: by mail-wr1-f68.google.com with SMTP id r3so13047695wrj.6;
        Mon, 23 Sep 2019 02:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MqnEXcdlN87EqTUKJmOH+iKlmaz8lFCv3VuvTRPKNYg=;
        b=KA5nrDNyZGvPNpZLPvKSaNs7sQh6lOFJCJvSJq96nHrR9+ElFaH3CVPWaHEwyUPd9O
         rj5uXbvXwh/o5U/mbP2PiSLUyboXBfetn4FKcQwnNcmIuAnJshPy8nyugNUw9aIQ6rNW
         JtcKD+0WJVIFQvvafusXbLpq8gqfysZ9atabqA+tt7xCFm4QYSC8K7xrb8OMQ0o1VRZ3
         +XC0Nbyn8hv4c7BleuC78ciOt8tv0y95fB3UDeHoWJw1h7K7krNW6LCclRDGMShSpT3I
         v4KXlsucqDyvH0/XK3c6ZRfT7wsJEuyUS+GPYTmoAvkmnmGzVLklypeDcNCfLsm1tHj/
         hF+Q==
X-Gm-Message-State: APjAAAXCprbNe21exLds59CtRZ0ouGSDVsIkjE5KEo2MElX6Q86mL8Dy
        LMeUhANr9KDkErbMOATI1lc=
X-Google-Smtp-Source: APXvYqyX2jsTQWCdkodTgpoobxQ2dq01kENJEKFTxZS+dJ/vtJUB1wHtTZ9GqHaa13+NkGl3qyyvLg==
X-Received: by 2002:a05:6000:14b:: with SMTP id r11mr1293264wrx.58.1569230269807;
        Mon, 23 Sep 2019 02:17:49 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id y13sm13602712wrg.8.2019.09.23.02.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 02:17:48 -0700 (PDT)
Date:   Mon, 23 Sep 2019 11:17:46 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com,
        ckeepax@opensource.cirrus.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v2 08/10] ASoC: samsung: Rename Arndale card driver
Message-ID: <20190923091746.GD4577@pi3>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130323eucas1p218c6822eca3869eb0d3b7380497bbca4@eucas1p2.samsung.com>
 <20190920130218.32690-9-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190920130218.32690-9-s.nawrocki@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Sep 20, 2019 at 03:02:17PM +0200, Sylwester Nawrocki wrote:
> Rename arndale_rt5631.c to just arnddale.c as we support other CODECs
> than RT5631.  While at it replace spaces in Kconfig with tabs.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v1:
>  - new patch.
> ---
>  sound/soc/samsung/Kconfig                         | 10 +++++-----
>  sound/soc/samsung/Makefile                        |  4 ++--
>  sound/soc/samsung/{arndale_rt5631.c => arndale.c} |  0
>  3 files changed, 7 insertions(+), 7 deletions(-)
>  rename sound/soc/samsung/{arndale_rt5631.c => arndale.c} (100%)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

