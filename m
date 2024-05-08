Return-Path: <linux-samsung-soc+bounces-3147-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D8F8BF633
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  8 May 2024 08:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A54271F23CCA
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  8 May 2024 06:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B646E23758;
	Wed,  8 May 2024 06:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NloDDEZo"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6975E28373;
	Wed,  8 May 2024 06:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715149489; cv=none; b=WAIZkswpkn/8tygVAraVbZ65LQ7snJJUOIZso2ZooiAGRgFV+BA73y5OXs+PliVYQxkWB+pJfNH/t90iWshE6tGS0+5bFfeZpNZ2XCnJu8efbVqHL3If0zuSzAJ4QR9DJr8BtSdhPnPGL0y4/gaS3q8Qk0t1PhEZ8yBSVQjlYy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715149489; c=relaxed/simple;
	bh=p6nrGwLvjeGOi1nMq/8XNnBJdlDdDoiGOZ2hZYq1OB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZmeAaF6os5zVmR20MWvqCZ1gSGDY83YMsfLAugxMRsnToRMblghyYJv3NBdx/Q3VPTxU1HjmHnWEyVFnEqxcTQpYILIkNzB9X8Y2o0ARoaAjuv3EWZUPIdl/wOrBSyK7O5IXXgZux6F2hLnY2rvfwontQhwUkDp06BowlRauV3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NloDDEZo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F35BEC113CC;
	Wed,  8 May 2024 06:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715149489;
	bh=p6nrGwLvjeGOi1nMq/8XNnBJdlDdDoiGOZ2hZYq1OB4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NloDDEZoQt+4vj2xEyVtrzlc+6LLFXQsPdQkB5GnnRGjieGHOnBJRFkwnz3iicEwd
	 UYxLpbvF6/MHGK7Mg1IKlcu/mBkQAMaC8dNKg60SEX/lK8fRBSdn8gavHpP03kTNKp
	 wd9xi/KNknlK1K1cUnTwvFg7ZMso7JbT5N+JGVDXl4gGxLKHlNufpsg3cn51zFtg5+
	 cVlzixBzRvSxSPz64zJmdgMWQT5tlc+Kj5Y/zKeuRkXePdmaDdxlsJTk07YCdagaFe
	 J68u++00l+KRQP/OOciwQtMC7pj7EqNiKP6ELLSoIcCKfQKYv2wlOQmBBn1F8MihIC
	 vuufvBNW1/Meg==
Message-ID: <49ff4f07-aaf9-4f29-ba97-b4b03b05f36d@kernel.org>
Date: Wed, 8 May 2024 08:24:43 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] clk: samsung: drivers for v6.10
To: Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org,
 Sylwester Nawrocki <snawrocki@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240504120624.6574-1-krzysztof.kozlowski@linaro.org>
 <8bf65df598680f0785c3d6db70acfb9a.sboyd@kernel.org>
 <b1fd9806-3e33-488a-a5a9-a156a2c735d2@kernel.org>
 <b3e320ecb16320f88d7db566be51b1e9.sboyd@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <b3e320ecb16320f88d7db566be51b1e9.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/05/2024 22:43, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2024-05-06 22:54:10)
>> On 07/05/2024 01:44, Stephen Boyd wrote:
>>> Quoting Krzysztof Kozlowski (2024-05-04 05:06:22)
>>>> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
>>>>
>>>>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.10
>>>
>>> I'm getting compile warnings. Is there a pending fix? Also, why is GS101
>>
>> I don't see any of these warnings. Neither local (W=1), nor on my CI,
>> nor reported by LKP (which reported build successes for this branch).
>> How can I reproduce it?
> 
> I ran this command
> 
>  make W=1 ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- drivers/clk/samsung/clk-gs101.o
> 
> and I see the warnings. They're actually upgraded to errors.

So regular W=1 build... weird.

> 
>>
>>
>>> describing clk parents with strings instead of using clk_parent_data?
>>
>> GS101 uses existing Samsuung clock framework, so that's how it is done
>> there. There is nothing odd here, comparing to other Samsung clocks.
> 
> Ok. Is anyone working on migrating Samsung clk drivers to the non-string
> way?

I am not aware of it. There was no serious development for Samsung SoC
in total for years.

> 
>>
>>>
>>> In file included from drivers/clk/samsung/clk-gs101.c:16:
>>> drivers/clk/samsung/clk-gs101.c:2616:7: error: ‘mout_hsi2_mmc_card_p’
>>> defined but not used [-Werror=unused-const-variable=]
>>>  2616 | PNAME(mout_hsi2_mmc_card_p)     = { "fout_shared2_pll", "fout_shared3_pll",
>>
>> I see indeed some unused variables and I will drop them but your
>> warnings are not reproducible.
> 
> Weird! I use gcc-12.2 if that helps. I've been meaning to upgrade but I
> also don't see much urgency.
> 
> I'll wait for the next PR.

Yes, patch is already in linux-next, so I'll wait a bit and send today.

Best regards,
Krzysztof


