Return-Path: <linux-samsung-soc+bounces-6-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 119FF7F22C4
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 21 Nov 2023 02:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF1412811E4
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 21 Nov 2023 01:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F07B1840;
	Tue, 21 Nov 2023 01:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="l8Xr/tFa"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3C617F2
	for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Nov 2023 01:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246EAC433C8;
	Tue, 21 Nov 2023 01:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700528613;
	bh=WydedWHI5hgSzmjYaAgFcEvQrWisnvd0Tah1sl3VwoE=;
	h=Date:From:To:Subject:From;
	b=l8Xr/tFanlzenlD+3PNZpFaaiyYi64e6EcTXv8cwYAW2jVViPmXn1n1c8PnhBZoUf
	 tPY8UE/ISp3cs6ZykeJFufzvmb4c+6UHGsJ2OXIYvBx7FF8NxEXP7Z8q5K9tzTlVwM
	 haF4ZLdvyqKBpKzDlo1JfsT2zcyl3gKiQFW6ZhXs=
Date: Mon, 20 Nov 2023 20:03:32 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: linux-samsung-soc@vger.kernel.org
Subject: PSA: this list has moved to new vger infra (no action required)
Message-ID: <20231120-brilliant-vivacious-swine-1a5ce7@nitro>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

This list has been migrated to new vger infrastructure. No action is required
on your part and there should be no change in how you interact with this list.

This message acts as a verification test that the archives are properly
updating.

If something isn't working or looking right, please reach out to
helpdesk@kernel.org.

Best regards,
-K

