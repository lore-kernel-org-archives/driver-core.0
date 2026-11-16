Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822188;
	b=rR+TORVB7PhS5141Pakf9R6YRbWBawDJF9kYKm+M3oVV68PNPTn+QRkzFG9wjCeKJFD9
	 sNrS9RTvQDC3+mlitB8cSw7Z9MPl6OUBmUkYPm23akVsbqTCMNxpFEIVsWvrrHqZgEIIx
	 9B9gXyQJNXLoWg80pFhEva7icyeT265hcCDZUabR0z83P9LYOqXM2qZs7kbR16mCKdL2p
	 of7qDViS6l8PoIoKFCI9woNTqpN6xO8FAVIlmh89KxKFZHyOXtXSIRJIId56DVH4jnlkf
	 cX1827acjPob07pEs0zLnwYhhA7hTvPDRoypMcFDsomvRjaLCV7eJ3vGQ2/rfoWeeZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=vmKj9J6/J/x0oEsZvbHBsUQKkmVzTWMXODXbHwKBqy8=;
	b=kxGHEeJ7gIMn6jWKE32KFWDujsrs/M2SpkfYr4fMytmEnesGWkbhkcCv6IzJKiWzBeKF
	 W3pDsVdf8QppRc6vELBSI+SoUKyJGkY+QF7fF5NB6gyepOMMi35MGH5jBmak4wj7RlrV1
	 bgx9KGCFs1mFav3iLniG05euL3DV1/SMxDNX4uAmJJQmBzWlCfJFT8+aNf0p/OEOSiRk1
	 zrgvlLavGmrAZH8yrfxFEIl+FrsKw0xyLX6fOPLe6+HpP4dPCLJVy9dJQrRsbQsgy18Kw
	 EyMzvSelISby8D4bm8TOwvLeUFyb8sYg+C44g+ipw70aCf42mlNFXxpy0K7gF0CwQXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPZb7Gyy;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A9C606A882
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 09:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87A9C606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPZb7Gyy
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso1262985b3a.3
        for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 01:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794822187; x=1795426987; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vmKj9J6/J/x0oEsZvbHBsUQKkmVzTWMXODXbHwKBqy8=;
        b=BPZb7Gyytj3c2sRcYNPZA2eFFQK+/VDGTfYdK3LzNslrbOv02z0QPS18OXvLHMqf2o
         qn3skTeb0F16S/PBAJpgkT9YjK1ZSYpb1dYhpZV968Xx8uxAiGav91oqI1tcUPFqK5ai
         eIKJcaiV/jEQthCPo/mM0alRbyTLrOWDTASu5Xpp7zID+wymLM20LASXW9g8Ptv5lswu
         zHkzPTsErhtVQJ/hLwTWLoEAYBmMyGf53FcUoTZw4BIqmhH7uLJuFNUKxX2lrgybigbT
         HaJOee93bvtdsSaoCr0SpniphVgs6P1r5JiW5fH22LantPz20CHoPKJr7TMZiLOXSRKa
         EAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822187; x=1795426987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vmKj9J6/J/x0oEsZvbHBsUQKkmVzTWMXODXbHwKBqy8=;
        b=fHKrqjg154Mx4JaXH6e2LWU0Hi7Dqm9lhO4r0VKs3Pes1+5qJ5/D4QTCGOQXeyWjL0
         h4q2CpWc+8lg0kPtaiUb6CqwjGQMa6udaMQmmHI0IEeeQlqR5E15ZvdVu2Q2x4cabFSg
         3VQ58/F/cPkkTOgnvTLcetr1z0txbFaCbVIy3AuCS9PvPMRT0O7QC1HfFsmf5+XBIZFz
         HYKpJB+Jz9pair2lJlfVBk5qL07jtv9apv60jkoi90Ap7gMInaTEr4COrBKvDwwkfT1i
         0MLm5Pwbc4rXzyE7f62YsIP9wCEJ/npjgShiAO9MjD1rkmMCw+sug7V/GMKs3iRIdAao
         LFCg==
X-Gm-Message-State: APuU4Z8XM7zOY1kk8XvCaEFe5fGu3GAe1kHTZhnKeO+KWXQ7JUojB4h1
	8VvLaAegUbj9Eavm8WexcGD1Wo8fzOD/8KYue5YXqbXU024VmVTKkXjo
X-Gm-Gg: AYBFou0oWlGc0ZaVobBw1+EvkX6jCvFyCjCWc+FU2JDIJ9UlAsMsDVESP/xLNx6LunO
	0QBTfH4KKWKxN8NaB9LtLxF5SMpjOu+AychZ+gHCMiFljqmJKED+kaZUc62cyzoXdQPXtcwHYvO
	JeP9gKT/aCFlvIAmX1GpF524Cey6nzfRSS+ev0Xi/PeSm9tYfsRYujES7sVOz8UaRszw+6d818K
	jR0etbecDVrtC41VfTMcD78T2Y4wTh6RthVUguPEzoTzG2Yxe3ErlzD9mkPwZc19SYgE3ZTkU5t
	i0Ey0Tg8ARuwTaUg02GnxmSHYiFkV9MLfiA5t4X6MKTADSashBIn1AHdSKjY4jqhf16BMa8nxTk
	Eojy3nNavL2CIZEcxjTFOZfqR+MIDevvj8YodDIuFDXKHQr90w0vNHKW4A586a+LigIqCM6ALeM
	gIVk3EHzZVncPIERXjNiCm7C1rbqaUKmupJU2T/vKoCOGa3ycjd+GsXiNNKaWbiS770j7BPWT+w
	SkAQij56RIuAwYGd8fIUh7x1/FmZDCyefW7pZOQvGzcX1JMHzjmbXN1VxKPeNegvnyXiVeogvKw
	pp8rueTpoGRNYT5QiAoBLctWFkALdQzVgwZpepwAIJeLudb8k3XwYJXE9cRKeqX6ThwMCHGSC0E
	1ckcCPNQyIPyC5KKghA==
X-Received: by 2002:a05:6a00:1989:b0:89e:b12e:7eda with SMTP id d2e1a72fcca58-8beb21cd892mr8957701b3a.7.1794822186847;
        Mon, 16 Nov 2026 01:43:06 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f133:af41:7614:f46c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a90fdsm3424231b3a.15.2026.11.16.01.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:43:06 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 16 Nov 2026 01:42:56 -0800
Subject: [PATCH 4/4] sysfs: simplify error handling in create_files()
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-sysfs-group-invisible-v1-4-94cd173a7d9a@gmail.com>
References: <20261116-sysfs-group-invisible-v1-0-94cd173a7d9a@gmail.com>
In-Reply-To: <20261116-sysfs-group-invisible-v1-0-94cd173a7d9a@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Fernando Fernandez Mancera <fmancera@suse.de>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

Both attribute creation loops in create_files() duplicate the same error
cleanup pattern by breaking out of the loop and checking the error
status afterward to remove created files.

Consolidate error cleanup into a single exit path that removes the
group's files and returns the error, returning 0 directly on success.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 fs/sysfs/group.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
index 699c2f9e8926..b90ba546dcda 100644
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@ -51,10 +51,10 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 {
 	struct attribute *const *attr;
 	const struct bin_attribute *const *bin_attr;
-	int error = 0, i;
+	int error, i;
 
 	if (grp->attrs) {
-		for (i = 0, attr = grp->attrs; *attr && !error; i++, attr++) {
+		for (i = 0, attr = grp->attrs; *attr; i++, attr++) {
 			umode_t mode = (*attr)->mode;
 
 			/*
@@ -81,11 +81,7 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 			error = sysfs_add_file_mode_ns(parent, *attr, mode, uid,
 						       gid, NULL);
 			if (unlikely(error))
-				break;
-		}
-		if (error) {
-			remove_files(parent, grp);
-			goto exit;
+				goto err_remove_files;
 		}
 	}
 
@@ -113,13 +109,15 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 			error = sysfs_add_bin_file_mode_ns(parent, *bin_attr,
 							   mode, size, uid, gid,
 							   NULL);
-			if (error)
-				break;
+			if (unlikely(error))
+				goto err_remove_files;
 		}
-		if (error)
-			remove_files(parent, grp);
 	}
-exit:
+
+	return 0;
+
+err_remove_files:
+	remove_files(parent, grp);
 	return error;
 }
 

-- 
2.56.0.679.gc527c65306-goog

