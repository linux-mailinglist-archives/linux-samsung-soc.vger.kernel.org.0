Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E159EA2F8
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 30 Oct 2019 19:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727763AbfJ3SGF (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 30 Oct 2019 14:06:05 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44395 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727762AbfJ3SGE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 30 Oct 2019 14:06:04 -0400
Received: by mail-ed1-f68.google.com with SMTP id b18so2505459edr.11;
        Wed, 30 Oct 2019 11:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FrSVqR4rubXbOdoO4xIlrJ/g2AylU6DO+rRGS6ug+TM=;
        b=uVssUMm6cjQdfCDkO8kwHYzIulhlCr5/nE+SqtXo0+491WDXG7QWahSPeru0ZFYibn
         leaeEqPllET5IXOrX4qF6Skb+8y1383gTzhgM5hVDvNNiuS9QUNPygPkJ9O9n9XFosCB
         t+064iV3AKOecHEQxo0lCsGy+Q/rX4oq83ZEMGu7xVqJWX/56DH16NdLtW6QMgP7NhaG
         74a5oG4XF2fx3XwBYWxnejHJ5mfEeI2USU+utgsQq/fiZfpH2LEY0Gqttw508k1Kft6U
         uwYojeyMFqv+WxjK6+JSCSapwJUwX88ydsGPBd5F9aXWBefdXvvbR8KZEid32+reyFKn
         gbCg==
X-Gm-Message-State: APjAAAU7NLQ/9XMwvQlISZmY5zwAlw6oVhpL/Cv1wY0Xn1hpMpSSC8ki
        VurfnIUFAYuWU6jXm+qZH6s=
X-Google-Smtp-Source: APXvYqzu4HoYoArCMfuZiHHYx5XLueApspB4kJAI+3/Kg9OneW/pR4iKPXYNA//dTC9X/UDqISTrsw==
X-Received: by 2002:a17:906:c793:: with SMTP id cw19mr886699ejb.25.1572458762736;
        Wed, 30 Oct 2019 11:06:02 -0700 (PDT)
Received: from kozik-lap ([194.230.155.180])
        by smtp.googlemail.com with ESMTPSA id d26sm17952edu.37.2019.10.30.11.06.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Oct 2019 11:06:01 -0700 (PDT)
Date:   Wed, 30 Oct 2019 19:05:59 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Kukjin Kim <kgene@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] soc: samsung: exynos-asv: Potential NULL dereference in
 exynos_asv_update_opps()
Message-ID: <20191030180559.GA8016@kozik-lap>
References: <20191029182742.GC17569@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191029182742.GC17569@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Oct 29, 2019 at 09:27:42PM +0300, Dan Carpenter wrote:
> The dev_pm_opp_get_opp_table() returns error pointers if it's disabled
> in the config and it returns NULL if there is an error.  This code only
> checks for error pointers so it could lead to an Oops inside the
> dev_pm_opp_put_opp_table() function.
> 
> Fixes: 5ea428595cc5 ("soc: samsung: Add Exynos Adaptive Supply Voltage driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> When we add a new driver, could we specify the which prefix will be used
> going forward?  In other words commit 5ea428595cc5 could have the
> prefix "soc: samsung: exynos-asv: Add Exynos Adaptive Supply Voltage
> driver".  The "exynos-asv" bit was missing so the first person to send a
> fix has to guess what is desired.

Indeed, I usually do not add it on first commit to avoid duplication
(prefix and later explanation) but I see that it would be helpful.


Thanks, applied.

Best regards,
Krzysztof
