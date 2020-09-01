Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D9E258BE6
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  1 Sep 2020 11:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgIAJpO (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 1 Sep 2020 05:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgIAJpN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Sep 2020 05:45:13 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E3FDC061244
        for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Sep 2020 02:45:13 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d22so483435pfn.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Sep 2020 02:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=r1NoCkHudRDLJveRbNuO/HjyuaNHKWaeWYMVpiMNyLI=;
        b=IvR0Q+6R6bFcaOGfuAMDKMmO6ZeAoUIfwg+n23hk0JrEEpQxvl0zLdpxOQ967DVww8
         ep2XmHnFf/UnBsHnlO1c9M41B8rETWmZJPb2H6THueHtpVcJP/TJFU/a/fEBSCzSYs1L
         KMP3BnvN+MfqLh7gEOjnz1wKAM9K/E+VR6LIa6j0+XmyNk47wkMKaLgLrxgCNq4AYApA
         boLaV+rCCvE4iU33jx8Vq9IToQGThKVB2jAFd4wJbAw/YhsQTyEX1z5yuPjyrlVSWTmq
         oYsl6RSOT8X81avhmYHL6QsvUN6z+7oXpHBTHeppkxokaG3gjumNx8PLLLKwPtzMD+87
         RmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=r1NoCkHudRDLJveRbNuO/HjyuaNHKWaeWYMVpiMNyLI=;
        b=phqdWEh04p9fR0YwCf4+gdWxSfHUbslhJidfF6n5GBQrCcAqkUJ3/JBALckkPdT5wp
         DR7AqUVWHEY/UFZ/sytsdRgdjq4K2b0I2ugL9eZNlnBMZgSpiUoLwfwhar37bcZlci/q
         boVuQWyD+gDgTWcrJ0QkgkhaFLOvQulhyLNF+Q5ki7F1hwVDXfihItLLr9zeCcTmqXOx
         t6oFhsx8ysWviSwZNdNu8giMSAgOlUYj5/F7MpLf2tuRWEF4fc7iQrobKU9YOoKWpks/
         M7l2VpexNqxtjJELT31I1vcGAzuIWfI6UrpXHUkDb6U5A5+BZ9ivLfbZjTWgaAM66C1P
         vbXA==
X-Gm-Message-State: AOAM533DFNbHw//WoiwDH/92RZCUfjzTAsffYTjRQdjoLNIJA6nbdQGH
        pZ2I7BBNvljzcwcqQtnMVslZOg==
X-Google-Smtp-Source: ABdhPJyaoSDKbwx6GB0/73NFH4JHGbgiFworG2T6RlMQNUOY1ihOxi09F8vrmeYZExwUoAfBHvxZ7w==
X-Received: by 2002:a63:348d:: with SMTP id b135mr754836pga.89.1598953512567;
        Tue, 01 Sep 2020 02:45:12 -0700 (PDT)
Received: from localhost ([122.167.135.199])
        by smtp.gmail.com with ESMTPSA id n1sm1241495pfq.123.2020.09.01.02.45.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Sep 2020 02:45:11 -0700 (PDT)
Date:   Tue, 1 Sep 2020 15:15:08 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     ulf.hansson@linaro.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        nks@flawful.org, georgi.djakov@linaro.org,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-kernel@vger.kernel.org,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH V2 2/2] cpufreq: dt: Refactor initialization to handle
 probe deferral properly
Message-ID: <20200901094508.4sgyfv3yj575wlzp@vireshk-i7>
References: <24ff92dd1b0ee1b802b45698520f2937418f8094.1598260050.git.viresh.kumar@linaro.org>
 <f75c61f193f396608d592ae2a9938264d582c038.1598260050.git.viresh.kumar@linaro.org>
 <CGME20200901085708eucas1p231ccacd7b41685ece92ee21e3b726f28@eucas1p2.samsung.com>
 <00a87bad-f750-b08c-4ccb-545b90dd87fc@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00a87bad-f750-b08c-4ccb-545b90dd87fc@samsung.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 01-09-20, 10:57, Marek Szyprowski wrote:
> This patch landed in linux-next about a week ago. It introduces a 
> following warning on Samsung Exnyos3250 SoC:
> 
> cpu cpu1: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 
> 1000000000, volt: 1150000, enabled: 1. New: freq: 1000000000, volt: 
> 1150000, enabled: 1
> cpu cpu1: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 
> 900000000, volt: 1112500, enabled: 1. New: freq: 900000000, volt: 
> 1112500, enabled: 1
> cpu cpu1: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 
> 800000000, volt: 1075000, enabled: 1. New: freq: 800000000, volt: 
> 1075000, enabled: 1
> cpu cpu1: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 
> 700000000, volt: 1037500, enabled: 1. New: freq: 700000000, volt: 
> 1037500, enabled: 1
> cpu cpu1: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 
> 600000000, volt: 1000000, enabled: 1. New: freq: 600000000, volt: 
> 1000000, enabled: 1
> cpu cpu1: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 
> 500000000, volt: 962500, enabled: 1. New: freq: 500000000, volt: 962500, 
> enabled: 1
> cpu cpu1: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 
> 400000000, volt: 925000, enabled: 1. New: freq: 400000000, volt: 925000, 
> enabled: 1
> cpu cpu1: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 
> 300000000, volt: 887500, enabled: 1. New: freq: 300000000, volt: 887500, 
> enabled: 1
> cpu cpu1: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 
> 200000000, volt: 850000, enabled: 1. New: freq: 200000000, volt: 850000, 
> enabled: 1
> cpu cpu1: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 
> 100000000, volt: 850000, enabled: 1. New: freq: 100000000, volt: 850000, 
> enabled: 1
> 
> I've checked a bit and this is related to the fact that Exynos3250 SoC 
> use OPP-v1 table. Is this intentional? It is not a problem to convert it 
> to OPP-v2 and mark OPP table as shared, but this is a kind of a regression.

It took me 20 minutes for me to see "where has my patch gone" :(

I wrote a small patch for that to work without any issues, but not
sure how I missed or abandoned it. Anyway, here is the diff again and
I will send it out again once you confirm it fixes the issue. Can you
please also test your driver as a module with multiple insertion/removals ?

diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index 5dac8bffd68c..e72753be7dc7 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -905,6 +905,16 @@ static int _of_add_opp_table_v1(struct device *dev, struct opp_table *opp_table)
        const __be32 *val;
        int nr, ret = 0;
 
+       mutex_lock(&opp_table->lock);
+       if (opp_table->parsed_static_opps) {
+               opp_table->parsed_static_opps++;
+               mutex_unlock(&opp_table->lock);
+               return 0;
+       }
+
+       opp_table->parsed_static_opps = 1;
+       mutex_unlock(&opp_table->lock);
+
        prop = of_find_property(dev->of_node, "operating-points", NULL);
        if (!prop)
                return -ENODEV;
@@ -921,10 +931,6 @@ static int _of_add_opp_table_v1(struct device *dev, struct opp_table *opp_table)
                return -EINVAL;
        }
 
-       mutex_lock(&opp_table->lock);
-       opp_table->parsed_static_opps = 1;
-       mutex_unlock(&opp_table->lock);
-
        val = prop->value;
        while (nr) {
                unsigned long freq = be32_to_cpup(val++) * 1000;

-- 
viresh
