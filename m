Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB9C9565456
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  4 Jul 2022 14:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233898AbiGDMIO (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 4 Jul 2022 08:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233342AbiGDMIN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Jul 2022 08:08:13 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA05D11839
        for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Jul 2022 05:08:10 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id w24so9172796pjg.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Jul 2022 05:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oRPwtSfaZ4lK+/Kwqo3hIoWwSAaNNETI/B4QeMlq4K0=;
        b=vJ8/VNDeZy+E+GejBNM7BapmNbdbn8iOiAYLS8BzvfKFvpk6CdR/Mnagao/Gw0H7jf
         LnQLiFNEht81PcZFPHiWhIaSCu70QDfOqAa6+yId1JCV4HSO1Unw3VcKXpVFK7l+uLAa
         6tgC/XrPbB61OdJR18NqwpzOUGI4obFkG6Jsi69ZcVRV/RfsUIhvkkLWPN3KU8aReJTi
         AFIjCf42RSzRiBRGfKs+tzI9gBb1Ye1L96wXhT1ElmU6pn/qgv75K8/crdjKUUfOX3J/
         noZLYEmHwmI1jmH5mN0RcBuHTxCbA/TegDWRR6awCiMU/3dx7+ZyEYVwegC7cot1yxTR
         zv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oRPwtSfaZ4lK+/Kwqo3hIoWwSAaNNETI/B4QeMlq4K0=;
        b=jsQxJOcW3lYca8qINc/St8dFDacslzaSCSFcbfpUBmwM9Khj3qoWUj70VWmwgVXlzb
         96fLB0sDeuZ2txKlhFz61At5mAjkdgxpIi+mGpBnWQ0bIZv/OiZeSMzOIvYBhV6sZ0QH
         wAmm8F0LGNpG9bRpCwNEaNDUBtHH+Z/jb9pRfcNUxhL738Aw+3MGy+HQl6AlD7Y8DD6H
         Q0yGFg/mbL2htp0HVpgnIDSSVC/s10LoYOadZwqKuRRLnvTrk2XQ30TtThUTsE2PtoWx
         DV1LtSl5eqz4VIdzc546z1bNNMrRnOCFFHumOVy7a5UDckWom24sRVc+IpwPwVZejLo+
         hOyA==
X-Gm-Message-State: AJIora9Ws/PShwoVlchTrlLFlcqFk9xuJ6M3Uxpa/DPoMgSPIaXaSmV2
        Pxw9RtkuLFT6MSv+fC/1e5dILQ==
X-Google-Smtp-Source: AGRyM1sM6QESGjlfD1GGt0oFtY+CVN6+kz3J/8IXAvOmEUXgWJ/VGwfVTka8Ig/8o207cGsoSgkOBA==
X-Received: by 2002:a17:902:b184:b0:168:a310:3eb0 with SMTP id s4-20020a170902b18400b00168a3103eb0mr36007275plr.9.1656936490190;
        Mon, 04 Jul 2022 05:08:10 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902714400b0015e8d4eb28fsm21099493plm.217.2022.07.04.05.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 05:08:09 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Fabio Estevam <festevam@gmail.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Nishanth Menon <nm@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Qiang Yu <yuq825@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Yangtao Li <tiny.windzz@gmail.com>
Cc:     linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        lima@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org
Subject: [PATCH V3 00/20] OPP: Add new configuration interface: dev_pm_opp_set_config()
Date:   Mon,  4 Jul 2022 17:37:38 +0530
Message-Id: <cover.1656935522.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hello,

We have too many configuration specific APIs currently, six of them already,
like dev_pm_opp_set_regulators(). This makes it complex/messy for both the OPP
core and its users to manage. There is also code redundancy in these APIs, in
the way they add/manage the OPP table specific stuff.

This patch series is an attempt to simplify these interfaces by adding a new
interface, dev_pm_opp_set_config(), which is now used by all the existing ones.
This series also migrates few users to the new API, where multiple
configurations were required and rest are updated for API interface changes.

This is pushed here:

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/linux-next

This was earlier tested by various folks, I have tested it again on hikey board,
it will get further tested on linux-next in the coming days. Build test is
already done by Linaro's bot for enough platform though.

The entire patchset shall get merged via the OPP tree in 5.20-rc1, please do not
merge individual patches.

V2->V3:
- Merged two patchsets:
  [PATCH V2 00/30] OPP: Add new configuration interface: dev_pm_opp_set_config()
  [PATCH V2 0/5] OPP: Replace custom set_opp() with config_regulators()

- The existing APIs aren't removed anymore, but are made to use the new core API
  to set various configurations (Greg KH).

- clk-names and regulator-names are NULL terminated arrays now (Greg KH).

- New interface added: dev_pm_opp_set_config_regulators().

V1->V2:
- dev_pm_opp_set_config() doesn't return the OPP table anymore, but a token
  allocated with xa_alloc(). The same needs to be passed to clear-config API.
- Updated all users according to that as well.
- The clk_names interface is updated to allow multiple clocks.
- Converted few // comments to /* */.
- Added tags by few people.
- Dropped the last patch to rearrange stuff, not required anymore.

Thanks.

--
Viresh



Viresh Kumar (20):
  OPP: Track if clock name is configured by platform
  OPP: Make dev_pm_opp_set_regulators() accept NULL terminated list
  OPP: Add dev_pm_opp_set_config() and friends
  cpufreq: qcom-nvmem: Migrate to dev_pm_opp_set_config()
  cpufreq: sti: Migrate to dev_pm_opp_set_config()
  cpufreq: ti: Migrate to dev_pm_opp_set_config()
  drm/lima: Migrate to dev_pm_opp_set_config()
  soc/tegra: Add comment over devm_pm_opp_set_clkname()
  soc/tegra: Migrate to dev_pm_opp_set_config()
  OPP: Migrate set-regulators API to use set-config helpers
  OPP: Migrate set-supported-hw API to use set-config helpers
  OPP: Migrate set-clk-name API to use set-config helpers
  OPP: Migrate set-opp-helper API to use set-config helpers
  OPP: Migrate attach-genpd API to use set-config helpers
  OPP: Migrate set-prop-name helper API to use set-config helpers
  OPP: Add support for config_regulators() helper
  OPP: Make _generic_set_opp_regulator() a config_regulators() interface
  OPP: Add dev_pm_opp_get_supplies()
  OPP: ti: Migrate to dev_pm_opp_set_config_regulators()
  OPP: Remove custom OPP helper support

 drivers/cpufreq/cpufreq-dt.c                |  19 +-
 drivers/cpufreq/imx-cpufreq-dt.c            |  12 +-
 drivers/cpufreq/qcom-cpufreq-nvmem.c        | 109 +--
 drivers/cpufreq/sti-cpufreq.c               |  27 +-
 drivers/cpufreq/sun50i-cpufreq-nvmem.c      |  31 +-
 drivers/cpufreq/tegra20-cpufreq.c           |  12 +-
 drivers/cpufreq/ti-cpufreq.c                |  42 +-
 drivers/devfreq/exynos-bus.c                |  21 +-
 drivers/gpu/drm/lima/lima_devfreq.c         |  12 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c |   4 +-
 drivers/memory/tegra/tegra124-emc.c         |  11 +-
 drivers/opp/core.c                          | 821 +++++++++-----------
 drivers/opp/opp.h                           |  32 +-
 drivers/opp/ti-opp-supply.c                 |  77 +-
 drivers/soc/tegra/common.c                  |  49 +-
 drivers/soc/tegra/pmc.c                     |   4 +-
 include/linux/pm_opp.h                      | 295 ++++---
 17 files changed, 750 insertions(+), 828 deletions(-)

-- 
2.31.1.272.g89b43f80a514

