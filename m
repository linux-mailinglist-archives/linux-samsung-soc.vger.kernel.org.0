Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1DFBB0FC
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 23 Sep 2019 11:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727921AbfIWJIP (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 23 Sep 2019 05:08:15 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46940 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727444AbfIWJIP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 05:08:15 -0400
Received: by mail-wr1-f66.google.com with SMTP id o18so12969650wrv.13;
        Mon, 23 Sep 2019 02:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tmMoz215KHiHYt4Ll2Ro4BC6di5AJcGWo8A7DQ1dHmY=;
        b=spkdFHh/oMTfpTRpISpunkIPtspnttXvqdla93pY+RKHSOmkqcNAsGZetdWDppTaYm
         JU20vl3Z43vrylD5aPyp+iW4pcUd7rkPDxoaXiTkWwrtxjXmELRoBxZ9QKXDyJECU7O4
         SGCBagaEMvr/eos13/gxDopF08KqTGjpJGZ+DNE9rwYsImKYz0vr0WcwaBYEVoo+OqOO
         Rw77eHQIukiW752I9dhLv1rfcK1GILWzHQM3Q1Vt1jT3cTP/v36md6t6oK4aEVWbHCYZ
         O/IEAjN8w5S+gadMvq7a2rhjwEQyhXMGSRuW4383c94L5IkIOQ9CW+OsN/9o5sZuuajV
         nOsQ==
X-Gm-Message-State: APjAAAUHa45vCcAW3RX9xZoFe8Gf+O4LxXM5h+9msN5HtojJ9GmJS/x6
        CJNCa83H8CpupDznrLtyaGk1Jxyd
X-Google-Smtp-Source: APXvYqxxz7xafqgEfOSFCn8V7BM7y8g8X0JT9J5mDxENqXlljKM+EhY7wNQyUH3m4B3AzLz2RugrKg==
X-Received: by 2002:a5d:49cb:: with SMTP id t11mr12649575wrs.158.1569229691633;
        Mon, 23 Sep 2019 02:08:11 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id a13sm21942066wrf.73.2019.09.23.02.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 02:08:10 -0700 (PDT)
Date:   Mon, 23 Sep 2019 11:08:07 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com,
        ckeepax@opensource.cirrus.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v2 02/10] ASoC: samsung: arndale: Add missing OF node
 dereferencing
Message-ID: <20190923090807.GA4577@pi3>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130315eucas1p2a31543214fedcdfe86196f176f554a35@eucas1p2.samsung.com>
 <20190920130218.32690-3-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190920130218.32690-3-s.nawrocki@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Sep 20, 2019 at 03:02:11PM +0200, Sylwester Nawrocki wrote:
> Ensure there is no OF node references kept when the driver
> is removed/unbound.
> 
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v1:
>  - rebased to beginning of the series
> ---
>  sound/soc/samsung/arndale_rt5631.c | 34 ++++++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 4 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

