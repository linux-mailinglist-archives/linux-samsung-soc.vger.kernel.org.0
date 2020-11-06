Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB9DC2A8FE3
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  6 Nov 2020 08:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgKFHFT (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 6 Nov 2020 02:05:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgKFHFT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Nov 2020 02:05:19 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42638C0613D6
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2020 23:05:19 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id q10so486511pfn.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Nov 2020 23:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X+vlFfwXaQyT67tNUyi81s2s5dR5xJEgy0PknD0rbz4=;
        b=x7tyrPdaqh682SqGflCsojgjTQx+BXzkcw1rNmmcDJ4f1/CcNFqWsU2TeslilqRYW6
         zc5/q2J7DYA6GaZpIl9YJEuw5A+2BygaKtcNZGbiJXmhxkSHLYjjXBFUVrm/3kU2FfxF
         HOpl09BHz7pxQM1vSb758PMQEHgdQo7a0vFwzSK04ezcCvy5z2tN77zFwQKb0oCEVS7Z
         5Wf5xaSLDOcwVEQi6x3vCm1v9HcJ36wHsCS7oCefyqpWqoytt13+6MJpeHbxPKWMFUZ8
         7D71Y1LBl2lTl2Ui7t2WW7/HoEOYoPNzVDuHeqlnp7Y7cKSpCWRT/VBoOVOVT9t0JXT2
         P84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X+vlFfwXaQyT67tNUyi81s2s5dR5xJEgy0PknD0rbz4=;
        b=gUhESH6lpJPFLxHAGhsYfvIPx7c2QiDy7pFCfAMvDhZweqIvf28v0k3OnKekDCqSSJ
         gib48Y4jtMbElqjK0mizTsHTRvQ/QvsDjmHsXZbDgec1r/adQ7nRwX0wx7RYnfhTLi+9
         hsRuiRRUx7Ck9yzCTvIju9/YhyIeHtaqkV/iOOU7vEOVaZ/nTmPw4vYNHcgipl9ruu6D
         SKdWReoE2UM20BuQAsrkvs9U3rSK7g8i1Ddfy9Sh9g/j3TZ3oOW8fIXlywtnyT34u0Td
         sujOm4HEFyOoxE9FSPkbH4LBdILh1YQ5njyB9oFN2ViS5nRIWhvooyfNrzhsd3So6nyU
         Vq0w==
X-Gm-Message-State: AOAM530o2D/NLJA2T5d4mZOciL6s2TN98tMx726hM4a70xdsBMsz7Xc6
        BoaZbq2jQAbCmeHU7LkXp/5twQ==
X-Google-Smtp-Source: ABdhPJwjHQpNsy+GXHXCwxvkwHWtDNd475+Vq8i4kMmtZzheVVRcd/hAft+93Mx61nTSrMPFd3mZ/Q==
X-Received: by 2002:a17:90a:af89:: with SMTP id w9mr989921pjq.72.1604646318621;
        Thu, 05 Nov 2020 23:05:18 -0800 (PST)
Received: from localhost ([122.172.12.172])
        by smtp.gmail.com with ESMTPSA id r3sm1023098pjl.23.2020.11.05.23.05.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Nov 2020 23:05:17 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Ilia Lin <ilia.lin@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Nishanth Menon <nm@ti.com>, Qiang Yu <yuq825@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Rob Herring <robh@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>, digetx@gmail.com,
        dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/7] opp: Allow dev_pm_opp_put_*() APIs to accept NULL opp_table
Date:   Fri,  6 Nov 2020 12:33:20 +0530
Message-Id: <cover.1604646059.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hello,

This patchset updates the dev_pm_opp_put_*() helpers to accept a NULL
pointer for the OPP table, in order to allow the callers to drop the
unnecessary checks they had to carry.

All these must get merged upstream through the OPP tree as there is a
hard dependency on the first patch here. Thanks.

Viresh Kumar (7):
  opp: Allow dev_pm_opp_put_*() APIs to accept NULL opp_table
  cpufreq: dt: dev_pm_opp_put_regulators() accepts NULL argument
  cpufreq: qcom-cpufreq-nvmem: dev_pm_opp_put_*() accepts NULL argument
  devfreq: exynos: dev_pm_opp_put_*() accepts NULL argument
  drm/lima: dev_pm_opp_put_*() accepts NULL argument
  drm/panfrost: dev_pm_opp_put_*() accepts NULL argument
  media: venus: dev_pm_opp_put_*() accepts NULL argument

 drivers/cpufreq/cpufreq-dt.c                   |  6 ++----
 drivers/cpufreq/qcom-cpufreq-nvmem.c           | 15 ++++++---------
 drivers/devfreq/exynos-bus.c                   | 12 ++++--------
 drivers/gpu/drm/lima/lima_devfreq.c            | 13 ++++---------
 drivers/gpu/drm/panfrost/panfrost_devfreq.c    |  6 ++----
 drivers/media/platform/qcom/venus/pm_helpers.c |  3 +--
 drivers/opp/core.c                             | 18 ++++++++++++++++++
 7 files changed, 37 insertions(+), 36 deletions(-)

-- 
2.25.0.rc1.19.g042ed3e048af

