Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562703126CD
	for <driver-core@lists.linux.dev>; Tue, 20 Jan 2026 03:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768878090; cv=pass; b=nhtPbE0Cpo7EneqkQQSIXCb2ifcIYy5jXNjYRzTPmGAW881looqSF7aJEgCgyX9F1ppnUomHD0YA+a3S0m7DdAGBAB2vxTPKQwiG2oGwtj2qINg1eNDRUuWCabDHS0zOcFqwyPpk+D5e9yofZQZS0MprZ7PS5RuKWV4wmqY1R8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768878090; c=relaxed/simple;
	bh=Fp/RefqjLYXhHlqSkRwLM9pIyoSo3WDJFITc4eMNbB4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=XiJOzxuWE898A8CwXeGwKRUQYyLmcZDEdBtpw0SodUnIa6J0y8PF42Ye5C26qlXDWT6+QvCFeHHOOFHgZJXxbfwCMDsX43ci3dcpHkTIr5+4hcdNbgEBuYRx5xh4QEUzWd18IzNbWr2TXd0RfnDqcORWOAUN+OdmpeGv26Ir/ro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R0t9j+e4; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R0t9j+e4"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-40418578e28so1797053fac.1
        for <driver-core@lists.linux.dev>; Mon, 19 Jan 2026 19:01:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768878088; cv=none;
        d=google.com; s=arc-20240605;
        b=aYRNN68oUW1+cO2jV8jpjRM7z1dkoQPL4hVuKMIThNM9J/RcAyHhjD/Qw3I1F7lSke
         GnV+B5nWCU/G6kx1u5ZHsMJSJcMwcy+AmfPjgcd3SIt6ZxDUcrf17VqkTgNO1XiWST+d
         PRM3an+2FlHm/Y8r/0WwbIaGdgPctJew6WRP5rWYYYikh6OxBnlbfkphLlLkyEgbvmUY
         gCrNNvmNYUxYRsfJNMLRPKW95eNRSQuNrabm21CeYbO00WeU7tVS0jAI/oDBGLbO988y
         pV0u8G0iubmOuwo3sRxT/5I6DozHtRcQ0jxX+NbBHvnwEuMnPYDvMm5NEbp+t3DtEBaI
         swug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Fp/RefqjLYXhHlqSkRwLM9pIyoSo3WDJFITc4eMNbB4=;
        fh=RCHhZyyd+EsEnrb/gBL4ae+9G6biS+hPQKxWRd1H3Ws=;
        b=YXCOARytiYOc0GAOLx4JYFO0RrxmaK6cmIYJPtYFbFV5myorX3/2jL761GGBrmt4X6
         M7FM/M9ywGjmXdiEOT+oWuY4y6M/IPA+7n0IqiibGVPdcpGTiPcN0PEznrMfvaGtctTj
         kPqAgKxJq0tj7n25GmjXWd7MC4KGDWLWBBotAvi6ayV5Pk001/Em4iJzBAYmEKUioZ++
         ckHLHgdG+qwHTarltYjsuYwHuNQnxI5SuGYgx7X700lRVbEkIm+mzGI+MqTVBZm7iyGl
         EPICCgT7mhxQxH7R4zcKPLzQ4LJLFto+ssVNAi291GL9tZPWZr00BJG5GNsqHWmeDsDm
         pg3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1768878088; x=1769482888; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Fp/RefqjLYXhHlqSkRwLM9pIyoSo3WDJFITc4eMNbB4=;
        b=R0t9j+e4EYfHs8c9inVJYKXvEcwxkrWJUYQ98E7AAyMMYzhf357cMUUUp6YbL2diyD
         PhD6DwYHA0qq2Stub5IaNoTktde7V3b4SxG9bGUGoKTCwwS9Qz51ohc19uz+bE+32Sr9
         yzCIJeCq1/cQBibHSY2ZHVmOGvj+GxnK6rRNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768878088; x=1769482888;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fp/RefqjLYXhHlqSkRwLM9pIyoSo3WDJFITc4eMNbB4=;
        b=TW76F1K+meR0BRhDpC2Igj1HHYP8bNeuZdgfiPNBTd5mbpa2PNNkAmGxkBHZYYr85Y
         zZLkRIQoGEmE6L2ZjHcblbeMhO/EQwCY2m6ZktIBwlYsvuUIf0c1RCDsgtli6lmFKlBG
         u54Zh9egJE9oIAkzx28WBbnt9p8kOLuKlGf8KkP1WguS8+JUaIAtfoUzRh/BpxA/UP1L
         cdrjJ26CBlwL2PsALKbja+3xhaRXKsci253sdjJ2pvIaEKmr1qaWQSuUkE2UbW/Ob2py
         kc2LZNJAHoByn79AhkbSUwSk2FK9jSrve/RzzP/ujr8XEC4rhX8prb+CinXMv7iRKD3s
         2KSQ==
X-Gm-Message-State: AOJu0YwJdOu5hJehCVBbcZQq6/RA10VEkvuy9XdgvEs7mco+o0FIAtO2
	i8JLO95VXGFANdoE/4Ib2YTX3yf+gvGzj75xBdZLXIzxjt+7KebwFgSVuqXMgsw8DVjrssLAgHU
	SG184X11w7v7nfWj232KA4P9hauQst91LJTbE+JwmyhfMFV9TGTUWGaE=
X-Gm-Gg: AY/fxX5Wzb9tN7PoxNF4MVyszxyGqUCjXaRTNiWu9A5AVjD2v0V2WsBnQRs4gC5jbBX
	aigQRdPH1bvYimLTnvzR4uyEy/WdHo2frLWRgvqJrjSJo6GfOGAep72AEqOTEm+Ger3K+TCUJgA
	twbsTj/+jueKxSwtCnQzI9fPfgsPhfWgseD++Nuf+DzQRN3tZni4Gb9RhcTLidpYR/bz2A9MC7s
	ES/mTgop/Fg7nDzlymhUeO6HGpmx5OJRhzTHW7LG0dE3WjoBqEp6yeGi18QK3EQ9Lb4Nz5TglBV
	njviosdJJXVDNjilQvpZHcq1iSk=
X-Received: by 2002:a05:6820:2290:b0:65f:7279:a5bf with SMTP id
 006d021491bc7-66118885a6fmr4934512eaf.8.1768878088180; Mon, 19 Jan 2026
 19:01:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Christopher Hoy Poy <choypoy@linuxfoundation.org>
Date: Tue, 20 Jan 2026 11:01:16 +0800
X-Gm-Features: AZwV_QhjsaLq7xLnMXD7K-synVt1bRSIwV3ug2XCb3-v6puNeILDTreZ_wCeBY0
Message-ID: <CAKkv+gz6ECsxysVRceF6+01SOLW5EGzYELyEJ-NuA7Tvux8kNw@mail.gmail.com>
Subject: test delivery to driver-core - please ignore
To: driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

first post, test delivery - please ignore

Chris Hoy Poy
Senior Systems Engineer
Core Projects
The Linux Foundation
Perth, Western Australia (GMT:+8)
