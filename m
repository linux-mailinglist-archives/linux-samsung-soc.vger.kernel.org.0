Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C89F7E172A
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  5 Nov 2023 23:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbjKEWA1 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 5 Nov 2023 17:00:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbjKEWA0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 5 Nov 2023 17:00:26 -0500
X-Greylist: delayed 5225 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 05 Nov 2023 14:00:21 PST
Received: from SMTP-HCRC-200.brggroup.vn (unknown [42.112.212.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E867E6
        for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Nov 2023 14:00:21 -0800 (PST)
Received: from SMTP-HCRC-200.brggroup.vn (localhost [127.0.0.1])
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTP id 902F8190E8;
        Mon,  6 Nov 2023 01:57:37 +0700 (+07)
Received: from zimbra.hcrc.vn (unknown [192.168.200.66])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTPS id 892E719188;
        Mon,  6 Nov 2023 01:57:37 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id 267881B8223A;
        Mon,  6 Nov 2023 01:57:39 +0700 (+07)
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id SjmNNtlw9u-2; Mon,  6 Nov 2023 01:57:39 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id E51BC1B8250F;
        Mon,  6 Nov 2023 01:57:38 +0700 (+07)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra.hcrc.vn E51BC1B8250F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hcrc.vn;
        s=64D43D38-C7D6-11ED-8EFE-0027945F1BFA; t=1699210658;
        bh=WOZURJ77pkiMUL2pPLC14ifVPRvyTQIBEQmxuN1ezAA=;
        h=MIME-Version:To:From:Date:Message-Id;
        b=UBsavj2YPB4U5TxGcTmrn1AZcK36c1uYCQiaaBA3ZZNXWT7WnqgXZDY2xU28NsxKK
         s0Xfxp+ZG4enDGRXNhXs1vlAr8iVCATfRxs6NstoLRM5AJoMzL2Im9pMWr1FcqczmT
         Pwpng6kb4Dj/wWxw3m8YDwLQZtfxcvXRyFfh7PXNbLinbsJxjPZG7z40l0aAyojiHP
         Ts/1+dvYg0JcnvWiSD1R8MZG0KMBqsOCWh+u7UOvo8qLYNgv5ygfIBBZsuUnW/OkX8
         D0bECLwP+KXGEiN2X+8CmyjkY9MCQN8ifI8XAx/iyYiVgg6fCwaSD5AOPYYK+pSSmf
         5vwLdKThpe2gA==
X-Virus-Scanned: amavisd-new at hcrc.vn
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id ho2qbEuzy9Mp; Mon,  6 Nov 2023 01:57:38 +0700 (+07)
Received: from [192.168.1.152] (unknown [51.179.100.52])
        by zimbra.hcrc.vn (Postfix) with ESMTPSA id 9E25A1B8223A;
        Mon,  6 Nov 2023 01:57:32 +0700 (+07)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?b?4oKsIDEwMC4wMDAuMDAwPw==?=
To:     Recipients <ch.31hamnghi@hcrc.vn>
From:   ch.31hamnghi@hcrc.vn
Date:   Sun, 05 Nov 2023 19:57:22 +0100
Reply-To: joliushk@gmail.com
Message-Id: <20231105185732.9E25A1B8223A@zimbra.hcrc.vn>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Goededag,
Ik ben mevrouw Joanna Liu en een medewerker van Citi Bank Hong Kong.
Kan ik =E2=82=AC 100.000.000 aan u overmaken? Kan ik je vertrouwen


Ik wacht op jullie reacties
Met vriendelijke groeten
mevrouw Joanna Liu

