Return-Path: <linux-samsung-soc+bounces-10497-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6540EB3B334
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 29 Aug 2025 08:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 812EA1C8116E
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 29 Aug 2025 06:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DD423ABAF;
	Fri, 29 Aug 2025 06:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bh/5p8+T"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C97239E80
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Aug 2025 06:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756448297; cv=none; b=h6vFN7U7giYM6iJenucOG/UoQLBvBiZ9UlmsIC+AZCDbZPPmREZIkV5Gk2r23xdr+8e4UVSIUPKFMl4bZdOb+yWXoQe1CH9D2SXDcwFIB10ZieHG9rgq6duUkA8iSedaDynHjHXcApq7TTHw58lurWZxvgrL7mRlFTrF5PC/5F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756448297; c=relaxed/simple;
	bh=qOf1M8CpxrREh2y0SwRzJRtBpqJMEe4p6G3QfMpjhkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1GIoCONL/qbOPYk8yarLH+U4Ytu4D8rWpAQEGqCFR8nFPSuSQXCM5KdVkxTYBvWQRKriH6BKQRW8CWv9wrm5zFi9I5DecTC3DPy6dYIqRW82l00zeMwY83/rvaqJQTx14CEvbYfpgqtxWdU2gqrtBL3nNSCdLwQ5ymLSGqHk6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bh/5p8+T; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7722f2f2aa4so378668b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Aug 2025 23:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756448295; x=1757053095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fyIWN60k8dYCbXXXMxmihVbQlVwII/BvZdY4wtkRha8=;
        b=bh/5p8+TUoz18yVKKu1bFIu5XGn6nO5LQCk7OW2nYNq6bYKfql/5xaCMDiBK5XQvDh
         jmh83zmJwEC+mSGjgJGCoAHbNgN2p3/Y+TQoJFj/iihz1hkXRxDAQfcaU8P5lRAcLqHd
         VZ4Uvl6+VSOZ7y+yksI+08xVTlLuOER6AQjZjXt9A2ZsKqy+y720cVOY2mSxjZ0TdjPW
         l4+SL1YAUZ74BKkuqv9wU/SjI32FPX4J/0YiZ9JMbOT8yy4huPyVBFWk+n/FCzVHDYh/
         DDs71lskDuaiVx1L+wdeqcwxF2lmb9aNuQycPggDRSAHnEYnTZCOCI6p7N2dTjCrE3lQ
         0+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756448295; x=1757053095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyIWN60k8dYCbXXXMxmihVbQlVwII/BvZdY4wtkRha8=;
        b=fuEQ5d+BWwUGrj6ckPZgCKqVPXKYJi12zp1dOzNqpNTxUqNS8mOTsaulASQi8X7ax/
         y/o81rnLTlQg+TEAIcmbIucxsH/U9AcMKutJo71uU8mzRctTfaqQfdT7jOqHX9JatMIH
         12XTZbykxThAJT8PK6eFlrRiUmUhm6mUW7m5dL/+K1Hj12fuosNx5wqYYZqUkL/EscnB
         YnuzhdB7UVBJOlWe/wEfMtdwH4a1Csx72imvDp/q7F8q1hWALl9l5Qo+F2oygKA7ajwG
         0Lw34JMJO6G8e6UVJstR0fjMp4UdwuFNbW5K81mPcfziTUnQ4jYT381+Rm4qTHJnRhBx
         SP8g==
X-Forwarded-Encrypted: i=1; AJvYcCXENQnD0KzTSJhz6djYcbz3pLqJLlQaPG+oHJ31kvjD/7eRbgn7tYouyT4kVDvtlrsegQYXAY7ZzDOOdqYF3IM0Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyITGLr7/dHV9FxB75eube98iocMMgAaBXRVXjA9lKkU8UbwCS7
	orKwKH+aiMs+T1tuh2Mc9S4ehKLuIM0OBKalVsMKjwkiZ775EqmEQjcBHYrd99M3Sqc=
X-Gm-Gg: ASbGncuzw6ExAHVA0FbMcBaymYWCZbV+VAZj911G0ccKSJ2TFJoH76I9Dq83CTqypW1
	4hW7XOcA+at1puYrLw4PQRXsB7onHd0E3Nez0YP+dnp8ZIlLLQr2OFX8nDyBoBIJa9oAvcTQNcm
	8A/G1vSXmZeCvjiVxj/tXaT0xYzAOwwEs3EzPObQrXtJcXXoBsgLNG1g4BFjQvw4cfLphXhur00
	6nV0+RsisfNF0jvK9lVn/5uAXR++KBuxorilQB5eekuJixu2uxEe3mQi9RVdSVRbI5Ys9BA1ck6
	4pobjQHHmRZO2+jL4e+3zV+Dc6MemtIT6kJ/9gQTeA4DehuwIyTnXF42Hy+RGmRR4wIlETFSHZc
	18l+cqljPlMmKP/cSgcCwcY6RjZ80Vzd/L6k=
X-Google-Smtp-Source: AGHT+IEdwrBA8fEPouruiBjmjO1y+VLHrsJ6SO97Twxy5LbO1fb87iKCtpWKSDsewOGX8ikCQhJ2gQ==
X-Received: by 2002:a05:6a00:3907:b0:749:472:d3a7 with SMTP id d2e1a72fcca58-7702faaf2acmr35042659b3a.18.1756448295215;
        Thu, 28 Aug 2025 23:18:15 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1b21sm1307488b3a.69.2025.08.28.23.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 23:18:14 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:48:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	zhenglifeng <zhenglifeng1@huawei.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Zhang Rui <rui.zhang@intel.com>,
	Len Brown <lenb@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Beata Michalska <beata.michalska@arm.com>,
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/18] cpufreq: mediatek: Use
 __free(put_cpufreq_policy) for policy reference
Message-ID: <20250829061812.fziokvashujzbtth@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-9-zhangzihuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827023202.10310-9-zhangzihuan@kylinos.cn>

On 27-08-25, 10:31, Zihuan Zhang wrote:
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index f3f02c4b6888..1fae060e16d9 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -320,7 +320,7 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
>  	struct dev_pm_opp *new_opp;
>  	struct mtk_cpu_dvfs_info *info;
>  	unsigned long freq, volt;
> -	struct cpufreq_policy *policy;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>  	int ret = 0;
>  
>  	info = container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);
> @@ -354,11 +354,9 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
>  
>  			dev_pm_opp_put(new_opp);
>  			policy = cpufreq_cpu_get(info->opp_cpu);
> -			if (policy) {
> +			if (policy)
>  				cpufreq_driver_target(policy, freq / 1000,
>  						      CPUFREQ_RELATION_L);
> -				cpufreq_cpu_put(policy);
> -			}
>  		}
>  	}

Merged with:

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 1fae060e16d9..fae062a6431f 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -320,7 +320,6 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
        struct dev_pm_opp *new_opp;
        struct mtk_cpu_dvfs_info *info;
        unsigned long freq, volt;
-       struct cpufreq_policy *policy __free(put_cpufreq_policy);
        int ret = 0;

        info = container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);
@@ -353,7 +352,9 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
                        }

                        dev_pm_opp_put(new_opp);
-                       policy = cpufreq_cpu_get(info->opp_cpu);
+
+                       struct cpufreq_policy *policy __free(put_cpufreq_policy)
+                               = cpufreq_cpu_get(info->opp_cpu);
                        if (policy)
                                cpufreq_driver_target(policy, freq / 1000,
                                                      CPUFREQ_RELATION_L);

-- 
viresh

