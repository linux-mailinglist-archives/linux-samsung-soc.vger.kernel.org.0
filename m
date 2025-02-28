Return-Path: <linux-samsung-soc+bounces-7158-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC213A49F50
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 28 Feb 2025 17:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A490C1893FBB
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 28 Feb 2025 16:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815092702AC;
	Fri, 28 Feb 2025 16:50:58 +0000 (UTC)
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D46189B84;
	Fri, 28 Feb 2025 16:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740761458; cv=none; b=lYeFIRhnLvZAfAgP4yE8/sUVQL5XdiwCwn5C4VdPpRDXecBHVVKQA3thQEF0dd91WXPu8tZ+UfRHrOx9nqUrjzx3DUZNzlRvEE5BP2gqXLIFhrl8pV+yKk7ixegUw2qRqWan/qCcbL7WFCrVHG6gMqmo972LCbqoW+SNHfpIMT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740761458; c=relaxed/simple;
	bh=RjvmYgFj26Tl1M9VV8mPvQ7wgYX8kNV0gdkARYL9DLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=tpVlwL2pUptixv/nR9u1ihE9Y89vtmBFMpLFlXJNwjE1vTquT5HdP6weBlKl4jTaou4vK3iJR8HpCs1CtnMpKW+hsvDWtldcYMLoOO06ASCQM6OYwEhzCTOLuJO7gcZFfXPy2XV5NgFScgiKcpAA9oKcCQy1eAdo8aVPLO554Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BA44150C;
	Fri, 28 Feb 2025 08:51:10 -0800 (PST)
Received: from [10.57.79.187] (unknown [10.57.79.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 349603F6A8;
	Fri, 28 Feb 2025 08:50:53 -0800 (PST)
Message-ID: <4b83669e-db37-4a38-ac43-5d210d7ce544@arm.com>
Date: Fri, 28 Feb 2025 16:50:51 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drivers/thermal/exymos: Remove redundant IS_ERR()
 checks for clk_sec clock
To: Anand Moon <linux.amoon@gmail.com>
References: <20250216195850.5352-1-linux.amoon@gmail.com>
 <20250216195850.5352-3-linux.amoon@gmail.com>
Content-Language: en-US
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 open list <linux-kernel@vger.kernel.org>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20250216195850.5352-3-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/16/25 19:58, Anand Moon wrote:
> Remove unnecessary IS_ERR() checks for the clk_sec clock,
> the clk_enable() and clk_disable() functions can handle NULL clock
> pointers, so the additional checks are redundant and have been removed
> to simplify the code.

This patch looks sane, just rework the 'goto' stuff in the
exynos_tmu_probe() maybe in the patch 1/4 so won't be needed here.

