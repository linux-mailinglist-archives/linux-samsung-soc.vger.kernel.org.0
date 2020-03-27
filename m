Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA7171955BA
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 27 Mar 2020 11:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgC0Kwd (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 27 Mar 2020 06:52:33 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38324 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbgC0Kwc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 06:52:32 -0400
Received: by mail-ed1-f66.google.com with SMTP id e5so10507261edq.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Mar 2020 03:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pPL3DbKSqHR4is6xqUQRzPhANHzl+P261m4uftHQCSs=;
        b=Yg8VuNjWEC5Ocfdp1ly5ICgm85rIYa08A8Yedd9YRpy243lsc5Zb/3D83turDVWlrt
         6SXB2DqB0LQSXq9MFGOwgkLXSAc6hHCNly+w6JTGwNXpX92lH1wWAITMArZ+pZY347eA
         zvNcamzy+ln5hT21Yg9zFdbeRAS5utu13c7MZOr4Uw8C1tYyCWM7b+OhfY3Iq55s0bW9
         AcuIASjhwocd9RrC72yoZVZwueOKnyfOFIVAwqvuwv2jBMrckO6yfSYRw/DImOnoSAvf
         KUwVWvj6+ZK1b5x9zx6mmvCjiD7mOVYK0pmLL9OjjASIHroQHvZMsq5DV6CETsCP07/P
         k6Ow==
X-Gm-Message-State: ANhLgQ00akxOeGgQFr5WC0RYBlpA36yny8eLFpDmcdM4pPoorCiGsl04
        92G71nTi3sIUWl5Kdv0iWAk=
X-Google-Smtp-Source: ADFU+vtMyan7cfGZzCK49xRjLfr5wfuajs7G7qfhS25x5WVa9mJ081jy6DYz+kA7JaeYzh63OVr4vA==
X-Received: by 2002:a17:907:2143:: with SMTP id rk3mr4222601ejb.50.1585306349281;
        Fri, 27 Mar 2020 03:52:29 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id i26sm809488edx.23.2020.03.27.03.52.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Mar 2020 03:52:28 -0700 (PDT)
Date:   Fri, 27 Mar 2020 11:52:26 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 2/2] ARM: exynos_defconfig: enable serial bus and BCM
 HCIUART drivers
Message-ID: <20200327105226.GB7233@kozik-lap>
References: <20200326083524.19577-1-m.szyprowski@samsung.com>
 <CGME20200326083531eucas1p166688e4a513fd919e92dd14d65c715fe@eucas1p1.samsung.com>
 <20200326083524.19577-2-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200326083524.19577-2-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Mar 26, 2020 at 09:35:24AM +0100, Marek Szyprowski wrote:
> Enable serial bus and BCM HCIUART Bluetooth drivers available on the
> Exynos3250-based Rinato board.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 2 ++

Thanks, applied (also late, might miss this merge window).

Best regards,
Krzysztof

