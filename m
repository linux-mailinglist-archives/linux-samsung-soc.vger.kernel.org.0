Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 728BDBB107
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 23 Sep 2019 11:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732027AbfIWJJa (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 23 Sep 2019 05:09:30 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50470 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727970AbfIWJJa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 05:09:30 -0400
Received: by mail-wm1-f67.google.com with SMTP id 5so8971654wmg.0;
        Mon, 23 Sep 2019 02:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qr/xD5b8NXreFir/G/KvgwREY1aVYsklecZUpoCc1pQ=;
        b=t2ILugg9tA1SPWvQBMVje9BZGeGv1w791/o0Lp6NxUmmXL/693XMSK4Aq6aLwQUllO
         8Wpu78N6GOzFLFyodpPrYV31L5G0ifFg9gX0Wgu1PpWb0qIvtDYCWHpQyc88lU00E16Q
         EtH/t/23r1olvr26PQGrOU59BQRq+ptA9vXQMk0kx4WiQCcsaDpM6fpLglyX4aUS/BQS
         wAuRchWWoH7Lw8QVKGljv4yCPMcegnsaksH9sK1sB1Hf29LeoDkUj3VW4jYfL1Ij+Uru
         kmpECBI/szIRov3FsXS6/cFWg6g4hKdV6nRH79cQkRIIUWEfzCrGVZRFYZJd0IFyPAQU
         tESw==
X-Gm-Message-State: APjAAAVHe2t6eoaPEG65WwsemrabtA5x/OvLjVW2wgFSJ6ClOVzqgdVz
        Nv5BAvWDfJf5jGjFQoJo1+BvhWC+
X-Google-Smtp-Source: APXvYqyEPIb00KUDWsPEDYltoMAk90fKLhEAwVNUnhK5Li2Iq6c0tFivgGtKwVopYcJBdAcKIOx9ew==
X-Received: by 2002:a05:600c:2311:: with SMTP id 17mr12600603wmo.39.1569229768689;
        Mon, 23 Sep 2019 02:09:28 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id o22sm19458607wra.96.2019.09.23.02.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 02:09:26 -0700 (PDT)
Date:   Mon, 23 Sep 2019 11:09:24 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com,
        ckeepax@opensource.cirrus.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v2 04/10] ASoC: wm8994: Add support for MCLKn clock gating
Message-ID: <20190923090924.GB4577@pi3>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130317eucas1p188d724710077d704f768798c6555c741@eucas1p1.samsung.com>
 <20190920130218.32690-5-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190920130218.32690-5-s.nawrocki@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Sep 20, 2019 at 03:02:13PM +0200, Sylwester Nawrocki wrote:
> As an intermediate step before covering the clocking subsystem
> of the CODEC entirely by the clk API add handling of external CODEC's
> master clocks in DAPM events when the AIFn clocks are sourced directly
> from MCLKn; when FLLn are used we enable/disable respective MCLKn
> before/after FLLn is enabled/disabled.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v1:
>  - addressed review comments from Charles
> ---
>  sound/soc/codecs/wm8994.c | 108 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 104 insertions(+), 4 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

