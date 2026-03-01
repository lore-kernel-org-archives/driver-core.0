Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBC7184524
	for <driver-core@lists.linux.dev>; Sun,  1 Mar 2026 12:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772368319; cv=none; b=nUYoc3E0aJ0NVC+4/rM4/5HWBgnvSE2GaByG79JqqXs3DBLsEiwoV35Eab71MUCiKUUe+1OXLdot31npcztJ0rWuG8KDrpNsQh5g5Qz22cr0REXjFFzxAfaeyH8A261Og0tq6VolHJuJSzFmXPbUJpSDsR71jhhzPeNOfPYAB0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772368319; c=relaxed/simple;
	bh=SaaFcH6Oc3jCFSVMmx10cF8ncRdwRf8Ta+7Tz1QJAk4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=EvUjTeqZxc8Yddw0lfVHR6ILSkm+qrc/iXvr1EsOLbJVpQn7iFAHUXnoPN7z6ETGEZAkLkwEAmIMHX78R3JI2niLbXugcZGCOd3yWLR2puw+g1p8w+AaBZoYnYMt59OPS19ce7YpzJA7jvd7R79R7ERhxMdovUpBkpU/YH+kPQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQRurTkR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQRurTkR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4837634de51so14110915e9.1
        for <driver-core@lists.linux.dev>; Sun, 01 Mar 2026 04:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772368317; x=1772973117; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gOAYb0Oy7G9A/bRMOH/gRXdzCm1K7chfFKNZ0qHtpLQ=;
        b=KQRurTkRj8ueexnY2HjljUIrPIS1y5+u6yQKyMC73oZEZ4y+xtX/P0xgXCjrBJL1Ba
         PQkBuKoT93hochCE3/XGPqxE7zPknNoX02KM9ewFF8/UJfwr5LuJ2+IStatpXH2cce5s
         mFIERiLTsT4yUjGRSyOVuokGLCmdA7bpP1J1WGmELs4tW4PBJgsEDdyG90pLsJUlvwb6
         RZet0L53pshdtQ02WiJ+UtAbE0lAtGgXeZzwUgEncPT3I/rO53l/wnZkfHaj0UQHsOyP
         GLlVTuddBFGkBEh0ieBwjSmd3DlIVNj6FpTT2mG3ZTguDE0IVHlzCChgt8WdDXp+K0JB
         8m7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772368317; x=1772973117;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gOAYb0Oy7G9A/bRMOH/gRXdzCm1K7chfFKNZ0qHtpLQ=;
        b=au0LA9DZo6CxJhCMqYXGedQS78swGUV7Hzk4FDIni4+yPLYH7gOB3/N9HvROOkQ9L2
         sJ1LdBsKFQoUBVRZvDHJb4jWqwIsR8i5p+2OmeR9WyLruZe3z5fvsJS1T+gW2dJzBM5E
         SbKXOJG9eOByL3s/FRXpxgNQ2mp2zksg2zBS01ZvutEolAy3Zk1nmwLyyYlhbPJE1K9u
         Jw+aKevyDsBHdsgTet3NAZLp5bivibDvtkJNDkIRNTwehjFjaeyN/yZPx8sZ5tgSwsJ/
         R4ZBc/hvBqrx+egWhdsTehOrY8HF5PYs2QskUW4chpjB00Qclp0aGl54IU+V61erHsSg
         d1kA==
X-Gm-Message-State: AOJu0YwKfvhTFGSeFpNLnBp+kTOjFfMwvYlrK02wZXe2TZZrAF2hI+C5
	Y6j8sFZH2ycPJ7LNxnz0R9cl5L+E8E/zAUD8qWgABIJvYtgwY2/yQSDD
X-Gm-Gg: ATEYQzxCX/VXnJRCCJbM8ROBEnuH5nJcpxbDKA83gudb10r63lZogiJs/q2mgsgXBRJ
	Y0MmvW61rW2DR9lMuyAQKTleY/q7Gk+jBg67k5lfbfidvawtM/uHTldz6l5u/QjaOam6nG9BVzI
	wenVj54RceCIcTfct8nrjFXvan1EuJKysoFw5ZnfbzUw5KOIuNA4AP51dM70o0Co9KKivnpUxO5
	O5PXs4KRxPHVTu4Sgb3rDkVqH0/Dp4eLYoQUGIC+L3We4e6TxSv9X8hw0w4vwWewSE4TOvcKqyw
	c+AuNLWf/2uWKk7Mch1PHP0FOb/cLPvoZMNf6fUmI3x8N0RkUVp0a30G0gwt5Avz9JvkeVrB6rV
	6TEb5K4SRNXZtOUhUJ/3gjYMhAdlFNf4Ao66CK537tLwbENgKwJ4RhQz6N8sUHLEjnCD4kbpyuO
	NXsMtczTzSO7k29l7fzmVNPtD2ZJR/TVvPNjqRVhtlezqNsHzmCUFtXjdTGPR0e6B0rl7W+S9W7
	8fTBCspZG47rNlEikl+hMFkvVgUsDK2rRHzg+F1hGlhEDNW3Olq0GrrMWzB4tGfHg==
X-Received: by 2002:a05:600c:3b18:b0:483:7631:befa with SMTP id 5b1f17b1804b1-483c9bc55d6mr146296345e9.5.1772368316663;
        Sun, 01 Mar 2026 04:31:56 -0800 (PST)
Received: from ?IPV6:2003:ea:8f04:4d00:b8f3:c9fe:a208:3449? (p200300ea8f044d00b8f3c9fea2083449.dip0.t-ipconnect.de. [2003:ea:8f04:4d00:b8f3:c9fe:a208:3449])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b346ccsm202763185e9.2.2026.03.01.04.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 04:31:56 -0800 (PST)
Message-ID: <7ff56b07-09ca-4948-b98f-5bd37ceef21e@gmail.com>
Date: Sun, 1 Mar 2026 13:31:56 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/3] driver core: make struct class groups members constant
 arrays
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <d13ed3da-898e-4b73-a98c-76a671258757@gmail.com>
Content-Language: en-US
In-Reply-To: <d13ed3da-898e-4b73-a98c-76a671258757@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Constify the groups arrays, allowing to assign constant arrays.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 include/linux/device/class.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/device/class.h b/include/linux/device/class.h
index 65880e60c72..2079239a5aa 100644
--- a/include/linux/device/class.h
+++ b/include/linux/device/class.h
@@ -50,8 +50,8 @@ struct fwnode_handle;
 struct class {
 	const char		*name;
 
-	const struct attribute_group	**class_groups;
-	const struct attribute_group	**dev_groups;
+	const struct attribute_group	*const *class_groups;
+	const struct attribute_group	*const *dev_groups;
 
 	int (*dev_uevent)(const struct device *dev, struct kobj_uevent_env *env);
 	char *(*devnode)(const struct device *dev, umode_t *mode);
-- 
2.53.0


