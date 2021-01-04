Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D564E2E9135
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  4 Jan 2021 08:35:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbhADHeX (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 4 Jan 2021 02:34:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbhADHeW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Jan 2021 02:34:22 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA267C061798
        for <linux-samsung-soc@vger.kernel.org>; Sun,  3 Jan 2021 23:33:41 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id lb18so9570906pjb.5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Jan 2021 23:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QTXH4ZBabQXPlZIujQgKbnRJD3TC6IE68x9pqFmtBcY=;
        b=phkZiroMjb2C8up3DUYIfoVF7kCXntKeedQ4qiwCI2pD9K7VSJidQcWn23Gd36gRLu
         /fWMAiXKOorzKGEcjKxgRVN69jmsgCswRLd1PZHJk2DO3LA7ti3Q1douYtKd7/7hD7kq
         gcTuSPuDvuz9zV5Zlw+xtChK4dRUnNdcroRf7ZCeJguS/gqE6p5/O4ufMsDKo5VLRviX
         Uh23VTBAvWR/YeCE+EP7fpoAj/MUUaaecGERL8h5TkFysk5tH8zVhxlSGE3eSfTqz/tP
         VGyt/7c6LbkOdrgf+A/oTrrpiKQcBJZhRojOMrajKCCk0d9mtZve3Kkj+Z6i6yEtP6DC
         V4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QTXH4ZBabQXPlZIujQgKbnRJD3TC6IE68x9pqFmtBcY=;
        b=J6StNWOYRlcAOV/fTy6knkKuDB61uqi41m3aAjxD3F7ziXt4W0V9CckqL9aCtYsUad
         lE7+/IKtkgMkzI/f/hTnH0CE+gUF6xgPXuZmw35lndRdT5WFEoGKJIh15KvMOc2ZBr7Q
         ELs9RedLUL6zVBMOGBQZrnRxG9tSd8jK1oreMPnncXVFNwBG2JdpfY6AuLZeL5/HoIQZ
         b+GjBWqdH5enPyN/m9E9PxdpaJIDG2tF/6eBhBoM09db3nvRb80oNCF/27tL9C+3pOTv
         ci1uXHDUoj4LUDO/5ikYhQSTwSZOtgbD1Ne+3OyCNF7LUNpPg+rEPrdld5zDSNBomOBn
         ohLg==
X-Gm-Message-State: AOAM5338G179jsNTzXeSUyGAi05U3BD97q+M81S13/j0peNsA1aZXZmc
        gwnU4lBIy6SrBDQpAd8tud/GcA==
X-Google-Smtp-Source: ABdhPJyjI2QljyiTHpicHkoa93QDvCtchRU1S1nSROelwSY5UUcsp+hu6LfLrqtbg1mOM7IFq7YKxg==
X-Received: by 2002:a17:90a:6a48:: with SMTP id d8mr27589269pjm.130.1609745621425;
        Sun, 03 Jan 2021 23:33:41 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id a31sm59966345pgb.93.2021.01.03.23.33.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Jan 2021 23:33:40 -0800 (PST)
Date:   Mon, 4 Jan 2021 13:03:38 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Yangtao Li <tiny.windzz@gmail.com>
Cc:     myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
        cw00.choi@samsung.com, krzk@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, digetx@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, yuq825@gmail.com, airlied@linux.ie,
        daniel@ffwll.ch, robdclark@gmail.com, sean@poorly.run,
        robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
        alyssa.rosenzweig@collabora.com, stanimir.varbanov@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        lukasz.luba@arm.com, adrian.hunter@intel.com,
        ulf.hansson@linaro.org, vireshk@kernel.org, nm@ti.com,
        sboyd@kernel.org, broonie@kernel.org, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, rjw@rjwysocki.net, jcrouse@codeaurora.org,
        hoegsberg@google.com, eric@anholt.net, tzimmermann@suse.de,
        marijn.suijten@somainline.org, gustavoars@kernel.org,
        emil.velikov@collabora.com, jonathan@marek.ca,
        akhilpo@codeaurora.org, smasetty@codeaurora.org,
        airlied@redhat.com, masneyb@onstation.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, ddavenport@chromium.org,
        jsanka@codeaurora.org, rnayak@codeaurora.org,
        tongtiangen@huawei.com, miaoqinglang@huawei.com,
        khsieh@codeaurora.org, abhinavk@codeaurora.org,
        chandanu@codeaurora.org, groeck@chromium.org, varar@codeaurora.org,
        mka@chromium.org, harigovi@codeaurora.org,
        rikard.falkeborn@gmail.com, natechancellor@gmail.com,
        georgi.djakov@linaro.org, akashast@codeaurora.org,
        parashar@codeaurora.org, dianders@chromium.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 00/31] Introduce devm_pm_opp_* API
Message-ID: <20210104073338.bbswxbewuxpj4ad2@vireshk-i7>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210101165507.19486-1-tiny.windzz@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 01-01-21, 16:54, Yangtao Li wrote:
> Hi,
> 
> This patchset add devm_pm_opp_set_clkname, devm_pm_opp_put_clkname,
> devm_pm_opp_set_regulators, devm_pm_opp_put_regulators,
> devm_pm_opp_set_supported_hw, devm_pm_opp_of_add_table and
> devm_pm_opp_register_notifier.

Please also mention next time to all the maintainers that you need
their Acks for their patches and that all these patches should get
merged via the OPP tree.

-- 
viresh
