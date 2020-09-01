Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA1A258C74
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  1 Sep 2020 12:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgIAKMd (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 1 Sep 2020 06:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgIAKMa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Sep 2020 06:12:30 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD83C061246
        for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Sep 2020 03:12:30 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id y6so293846plk.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Sep 2020 03:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XWSSHaVX/snKumnbKNEvkol80PJsTwWkmNhhl1k4Kjk=;
        b=Y5+Z1RtCpQ3yTrjyZD966M4fhioduGWH3doPN6534EUeP89bz3sc1Ca908N9RFKv0b
         djpvWLQdqe/lFNpUq2bbQmgpF6BcE9DxFTadnoE0Tdxx1f7Oy/bzQ01L3i2Qwh39gaQq
         KW24AUw/zh+FOMPqzhI0BDC0uzvB2+toudrXo0SAKUkwBFkioSMpJ8UfLKHfW058UIwp
         R0fFCFr/bfL+GoU0aEmpL7mGruvSBDU0PthQ2LlbWxOh5MokuJvFAV/QckTXUmQQoIut
         OxOZIqjHQiKzVCeCxbxX9Qhg1xVWmPl40I9uxw2FiQamywtSrZ8NkE4MjkxBvODIQOl+
         Z9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XWSSHaVX/snKumnbKNEvkol80PJsTwWkmNhhl1k4Kjk=;
        b=XusxFf0YKxTIpQfO/3deEen24uBtrZt8YLY37o22CITzP4BCkHaGNXdP3I7ahf11o4
         Vehm8SJGpSt+6GywZYkqP2i/4l0W8ZCF/dreso+p9Pn4h2yu/641MGqe+KEThq1YW0Yh
         blBl7dyq8b9kNOGafP/YP7gO892prOTXHh6MFG+J8BiXmJwXocBEcF8o4CV9bvY4NksI
         KzEjE9PvDR+fiLSAeGvGGnQoob+2iUAcqFPJnxkHRQXX3Km+fFOj/E3USFRxvT677seF
         9tWJ4Ub9MvU9C7C4Cj1yohhKlSkZXhJk+KwTasTWNZbxnUWRqbDOdBu2WP/F+wfKyV/B
         jtqg==
X-Gm-Message-State: AOAM5326rT6l1329aqnQN6PI5hH/iyLkpqSRpag+EUkXZo9dCwHGpuHN
        hPJCBxzBokah08YJe17QKo6uBQ==
X-Google-Smtp-Source: ABdhPJyK0PoihFW7RTF2RV8HvlSOdVmlcwoNy9qQhrwRkZuUAJdzDjDrDhwjS6SOqL9t7C0crwi//g==
X-Received: by 2002:a17:902:8e8c:b029:cf:85ab:8d4f with SMTP id bg12-20020a1709028e8cb02900cf85ab8d4fmr1133058plb.2.1598955149584;
        Tue, 01 Sep 2020 03:12:29 -0700 (PDT)
Received: from localhost ([122.167.135.199])
        by smtp.gmail.com with ESMTPSA id u2sm1038048pjj.57.2020.09.01.03.12.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Sep 2020 03:12:28 -0700 (PDT)
Date:   Tue, 1 Sep 2020 15:42:21 +0530
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
Message-ID: <20200901101221.fmjjrmbbzrnqdgos@vireshk-i7>
References: <24ff92dd1b0ee1b802b45698520f2937418f8094.1598260050.git.viresh.kumar@linaro.org>
 <f75c61f193f396608d592ae2a9938264d582c038.1598260050.git.viresh.kumar@linaro.org>
 <CGME20200901085708eucas1p231ccacd7b41685ece92ee21e3b726f28@eucas1p2.samsung.com>
 <00a87bad-f750-b08c-4ccb-545b90dd87fc@samsung.com>
 <20200901094508.4sgyfv3yj575wlzp@vireshk-i7>
 <383b7a8b-4cbf-d156-d9f0-4990cdde8d43@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <383b7a8b-4cbf-d156-d9f0-4990cdde8d43@samsung.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 01-09-20, 12:05, Marek Szyprowski wrote:
> Indeed, this patch seems to fix/hide that warning. Feel free to add:

s/hide/really-fix/ :)

I assumed that this problem is going to be there, when I applied the
other patch and so was trying to write a fix but somehow skipped doing
that :(

-- 
viresh
