Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4DBDF4BD
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 21 Oct 2019 20:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbfJUSFF (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 21 Oct 2019 14:05:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:37612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727017AbfJUSFF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Oct 2019 14:05:05 -0400
Received: from localhost.localdomain (unknown [194.230.155.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7D48A20B7C;
        Mon, 21 Oct 2019 18:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571681105;
        bh=7/5VK+xn/6vmDaWIEvqYGKbB3bCiDiZ01kOVwFRYjmY=;
        h=From:To:Cc:Subject:Date:From;
        b=EjqPGCLs6eVzd1F7mNsDCd8RzvIoNNps1A45vlLiJTdV0yv6QX2NZDl7GFQ/O/EOJ
         /xgxJAldxhapvtQ3UabTRYtOb4saJXfYGwIWCEp3I82nK6ywWjYQFKMLlQDGNgrK+u
         mBjeIAphaO2nMxuam1tFqjRwlKNDzZGSK/uVwmA0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL 0/5] ARM: exynos: Stuff for v5.5
Date:   Mon, 21 Oct 2019 20:04:48 +0200
Message-Id: <20191021180453.29455-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Samsung had quite active cycle so I am sending early first part.
This includes two topic branches for DMC driver: bindings and driver
itself.

Best regards,
Krzysztof
