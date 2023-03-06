Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 390806AE05D
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  7 Mar 2023 14:22:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbjCGNWn (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 7 Mar 2023 08:22:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbjCGNWL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Mar 2023 08:22:11 -0500
Received: from mail.ettrick.pl (mail.ettrick.pl [141.94.21.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D6CF76B1
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Mar 2023 05:21:12 -0800 (PST)
Received: by mail.ettrick.pl (Postfix, from userid 1002)
        id F3455A4137; Mon,  6 Mar 2023 09:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ettrick.pl; s=mail;
        t=1678093580; bh=KHux3km3Civcx5ChslOYQZwQRBjoJa4kWJfGcMIuN6w=;
        h=Date:From:To:Subject:From;
        b=GV2cfluwHn8GM0kYUxSFte1BHKvkhQsoOGSs/sm1LVVMfbJgQEqyXqADiFyx3B6Jt
         W5fLWcsK1cfgSgavUZBR5j4PkX5h06LBezJ7trLn1PORa7o4oWzQl2qjin4g/vm7Dg
         DWrjo7KzgP8+TpL8Bg6IrVdRpL2EDlh2nqPCVb3271ASK1CG5daYbACLKIUxHOTlNT
         VUHeAYID2p1Nig47+LrlrpP6UUUhZZ9EvADKGfC3fy4hmZYEWgZmJlk3AlEh0LLDIQ
         FmZ7jKvn1IdUxRRyP7f1N/biTBWwnXPhQ8zyjvk7rG2WrEIUTlqqXQiW9x4ytesGpf
         /pTWq7krVHw/w==
Received: by mail.ettrick.pl for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Mar 2023 09:05:52 GMT
Message-ID: <20230306074500-0.1.97.3701g.0.hfk912llbp@ettrick.pl>
Date:   Mon,  6 Mar 2023 09:05:52 GMT
From:   "Norbert Karecki" <norbert.karecki@ettrick.pl>
To:     <linux-samsung-soc@vger.kernel.org>
Subject: Fotowoltaika - nowe warunki
X-Mailer: mail.ettrick.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
        SPF_PASS,URIBL_ABUSE_SURBL,URIBL_BLOCKED,URIBL_CSS_A,URIBL_DBL_SPAM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: ettrick.pl]
        *  1.2 URIBL_ABUSE_SURBL Contains an URL listed in the ABUSE SURBL
        *      blocklist
        *      [URIs: ettrick.pl]
        *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: ettrick.pl]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [141.94.21.111 listed in zen.spamhaus.org]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: ettrick.pl]
        * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Dzie=C5=84 dobry,

chcia=C5=82bym poinformowa=C4=87, i=C5=BC mog=C4=85 Pa=C5=84stwo uzyska=C4=
=87 dofinansowanie na systemy fotowoltaiczne w ramach nowej edycji progra=
mu M=C3=B3j Pr=C4=85d.

Program zapewnia 6000 z=C5=82 dofinansowania na instalacj=C4=99 paneli i =
16 000 z=C5=82 na magazyn energii, ni=C5=BCsze cen pr=C4=85du i mo=C5=BCl=
iwo=C5=9B=C4=87 odliczenia koszt=C3=B3w zwi=C4=85zanych z instalacj=C4=85=
 fotowoltaiki w ramach rozliczenia PIT (tzw. ulga termomodernizacyjna).

Czy s=C4=85 Pa=C5=84stwo otwarci na wst=C4=99pn=C4=85 rozmow=C4=99 w tym =
temacie?


Pozdrawiam,
Norbert Karecki
