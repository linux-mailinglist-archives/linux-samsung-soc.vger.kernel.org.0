Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA934338576
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 12 Mar 2021 06:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbhCLFdh (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 12 Mar 2021 00:33:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbhCLFdP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 00:33:15 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42E3FC0613D7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Mar 2021 21:33:15 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id q12so922246plr.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Mar 2021 21:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Yn9um0RUV5qS6ZDS+XmJIEF5UruSaGYqcCAn+8nlwK0=;
        b=AsT0a31K/s61Ur3ZyBxZIWuCMUPx2OBLJZtWxZ9I7oct+ejDM6jX9oK7HtwlYiPt7T
         dQjLuYCZAG8rAuj79j6RFrwqsCBWIHl1zZxIxaGWyL3wXzAFxfvOrg1KVUKkCisdS34d
         5unwD/W+yvGr48R+MEJBx6+vSiF9GuC3bTT6PSiuioz6uxAswGWKYpDGRzTepzNoAdRP
         3zIxwnJJsHmQdX+JNQmt3cWaVTgrPnJuzFDEUWUoCjL87wnD0EeFgsqOudsTwbftnhUq
         yCyR5d02IREhzNavc0wn85MY5VtSWg6BNEHGcN1VNCOVrtgMOvXZX1TUN4TzPyMcy21z
         fhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Yn9um0RUV5qS6ZDS+XmJIEF5UruSaGYqcCAn+8nlwK0=;
        b=nQ3YQC/6AdyEGB5hV06goms4Hx2P+RF+pSybfAyATHxU97KoV4IUDgZkZzuZYHFdgH
         tM82BMZftGeF7y59HPKDb7LuwLHl8vGBmYqVVA4FlHL1IcoXT28JGOtNsm2x3lFgsBk9
         rZUyyWlgkYC2SvGCR7XTm0J8ocbKEh4xxTpvoWnu93GW/OIt0EA73TextSTYqdJs1l/F
         tsatGr+LV14Qj8Wj9VXDgP+Gk41raYT6Py90nQ7WcZkbj+jjdtmAAGpgak6Ty57UsK+o
         s/ogerqX1Y3ViviF/MNwitcfY7wFvdilJ4MeM2G5slrZxo6tX1WWxxq/YRJbejD8Kexh
         ZBsQ==
X-Gm-Message-State: AOAM531DZZBCNrTaCIi+Od2NxOL/cqOu3ZwOMD7fI2wOEG89zeJSxER6
        97EY8X54ReFMZ8RKfsMNVf9v9g==
X-Google-Smtp-Source: ABdhPJyDxvuOHwV2kjRNLGoR8RcX493onMZPdYf0HajVty4Da/2VfFbEKgGgJtSunQpX+xy+QefzoQ==
X-Received: by 2002:a17:902:e78e:b029:e4:84c1:51ce with SMTP id cp14-20020a170902e78eb02900e484c151cemr11595726plb.25.1615527194476;
        Thu, 11 Mar 2021 21:33:14 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id z2sm4059367pfq.198.2021.03.11.21.33.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Mar 2021 21:33:13 -0800 (PST)
Date:   Fri, 12 Mar 2021 11:03:12 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 01/14] opp: Add devres wrapper for
 dev_pm_opp_set_clkname
Message-ID: <20210312053312.zgke2mzjkqmwn67i@vireshk-i7>
References: <20210311192105.14998-1-digetx@gmail.com>
 <20210311192105.14998-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210311192105.14998-2-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11-03-21, 22:20, Dmitry Osipenko wrote:
> +struct opp_table *devm_pm_opp_set_clkname(struct device *dev, const char *name)
> +{
> +	struct opp_table *opp_table;
> +	int err;
> +
> +	opp_table = dev_pm_opp_set_clkname(dev, name);
> +	if (IS_ERR(opp_table))
> +		return opp_table;
> +
> +	err = devm_add_action_or_reset(dev, devm_pm_opp_clkname_release, opp_table);
> +	if (err)
> +		opp_table = ERR_PTR(err);
> +
> +	return opp_table;
> +}

I wonder if we still need to return opp_table from here, or a simple
integer is fine.. The callers shouldn't be required to use the OPP
table directly anymore I believe and so better simplify the return
part of this and all other routines you are adding here..

If there is a user which needs the opp_table, let it use the regular
non-devm variant.

-- 
viresh
