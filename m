Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 073CF207A01
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 24 Jun 2020 19:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405387AbgFXROr (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 24 Jun 2020 13:14:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:37440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404287AbgFXROq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 13:14:46 -0400
Received: from localhost (unknown [171.61.66.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EE1E820836;
        Wed, 24 Jun 2020 17:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593018885;
        bh=ldgLw1UAnKNqF+EPRTU48c5Nd5DIfRXfmkzlt6uzvBI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=01EpuuG8Jsn/ChUZvdAWkMni/UAQy+g+0jr4D8EP+peHTfm1adk6AVC3QeYdyUlFH
         VXs1sIc/mklthxJ+vtgfez0AXVJ1lNsSrWHjU4VgfqtTvYoZDrgpaAkdP+Ll84/QnF
         UeETpIfbZKEQF9u7zvFTE/Jk+4lmx26J/a3nVUNU=
Date:   Wed, 24 Jun 2020 22:44:41 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
        Kamil Debski <kamil@wypas.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH RESEND v2] phy: exynos: Rename Exynos to lowercase
Message-ID: <20200624171441.GG2324254@vkoul-mobl>
References: <20200617152803.17941-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617152803.17941-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 17-06-20, 17:28, Krzysztof Kozlowski wrote:
> Fix up inconsistent usage of upper and lowercase letters in "Exynos"
> name.
> 
> "EXYNOS" is not an abbreviation but a regular trademarked name.
> Therefore it should be written with lowercase letters starting with
> capital letter.
> 
> The lowercase "Exynos" name is promoted by its manufacturer Samsung
> Electronics Co., Ltd., in advertisement materials and on website.

Applied, thanks

-- 
~Vinod
