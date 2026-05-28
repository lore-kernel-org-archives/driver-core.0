Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C813927A916
	for <driver-core@lists.linux.dev>; Thu, 28 May 2026 05:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779946238; cv=none; b=IZf6i9IvD7jBIDap/7rhl1K7gPIb/zNVsDLFwc3Kem9qctNOM07Z+y4sCh0gW7PxBY+c/tk1ZH3ty+VA6YD2PP8Wea0kUlNqMu+cMSZt7M6EtRku+pIs0x+n0YpSCOLRU7kk+AFqDc/LNyLiqiynLRPCHKwrOeRStAoIwjHYhgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779946238; c=relaxed/simple;
	bh=Bjf7hN3TI8rBFo86J3VB/I2bXgASxc3O0HsCfJhlguc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MBsI4598/g8FkkH5VwO2R1ql2yGdAHMxGpL5ydvVRmgXwSeCF+FP8YywVJuun1Tp/UNcPxA7I+gMq/BEOE9v4IoBIi0VDH1wAIlPPz3eP90C29iOUaWEemIhL/XmEcjLmDy2cBecvjlZ9OQGY81K5R0hX3CyItCDOE4AXQx+guo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ehe31rsS; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ehe31rsS"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c8025f1c227so9481672a12.2
        for <driver-core@lists.linux.dev>; Wed, 27 May 2026 22:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779946235; x=1780551035; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=llv9eK39iuv/ZdjHyRDnfcx6/aCeoNvT9KJ0UUI6ILE=;
        b=Ehe31rsSD8/pbE0q/RaoL02/amzW6d/ccytUvwWc9GvSv8CIGaPzfKqHcMiQfeAwZ3
         qXBZqsP1+erTYRqu1BQxxRIFUBigwCwZ6/uhDQL4gfUUN8SkeZEUK9axVSCRGMbSmJsg
         PAWzxaqIo3hAY2eGZZnjYrQGeThskPZFAAFsDeWS0bQEIG1kpnjD+to/lj3YNF61wNCE
         JjrmGsYlDmA6KQp1/CSODAmYTCHj6XpAu2NE0WDGtkiJp8Q1JccDZMBEsdFHcO/L9rJR
         2P+bt/EbQ5cjOD4f6ngy4naQYEpGpATsfDOhNLRWVKqsLNig9rxXgUqvYzRB3j93rIq7
         8tPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779946235; x=1780551035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llv9eK39iuv/ZdjHyRDnfcx6/aCeoNvT9KJ0UUI6ILE=;
        b=JOnwdwRasQsHrdXkgAakW3VZhg1BmhhezHSnA+F17736/73VdGKVJMYewkGFwyEPfT
         fATCQarN6q72bY+Aym3nvTb3rXtJD0lr11220RLP/qU+2BArjcxJqiIY6XIF4JDAMGv7
         uQ6oA/co7RHrYiLATtMolrKiS7yrRd9n930FWiPjxmhcQYF4qJYgWmcfIcQErASVMta2
         6O2d17eMV+7qgKcUVi7CNo3bfBK+vRNaQ60+koNLRBJfZuf4JdUT/Ge31NTh3FN1g8Dh
         z9RRXYiITQ6Ocs3e191Xa/7MrIdjEfZcOrq5wOho9vs8BzfVTdUwvKRPuqROllK8UHSd
         +sfw==
X-Forwarded-Encrypted: i=1; AFNElJ+RaIdIkvGkhvLQLys5DD90UsxTWutMwYBkgfS+FT3LULnMg8anrvXjRsSbv93K3BdsNxtLmAWUczxfRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx01dSmpqnWv9KEtGPoGNC6fmJHiDPCRMdM+GHJ+HqcF8FVZ/dT
	xIRlNZBjCaHjkiSKv9Hg1+X+tXkvvtu73MNMIH97L+EkoPJB1rxFToi4PGZ1bg==
X-Gm-Gg: Acq92OH4cT9HE8Zxm2dXdg6Irt1nY99t3oJFsEfkjvFDi98F1uxoJPzujSpQGSIcCeS
	SaU2odsBi0tppdBio3TJXs6B1DOk2aoWCeXRTN9CVRUrmKLRxbT+7RiFkLD60Ebw4CW9nHiNpDP
	bVTJrnk5yGFwjByuHtzyBO+KrEm1LTjir6S8z6+MX3lRxt7VE7g6D4s39fSbxMQrozH7tZG2Nn8
	u8783Q6NkqdnuW4m4vzL0v/+FJsQOKgQhC3XSddKyBrZkSAREBb/5J4kYDOVEps1kInwIZOcwN4
	k4Jo9SL0hFkkh0rdkyobvLXNs4JsdjnhPQW7EaIIFkx0wAGKXq0mhrQobxZbDIHoL3Y6tC4HhWt
	FJK6r7KTLKEJB4OagWqy6kfOyLd4x1HkLOXuyUt9Rwl3HyMaCSuZjkBhTYOr1QYhBSU6Of8VHTj
	7xoiz0VqoJzygF49thGkHAmXTF3R4+4u3qIdw6Iu/vla0QCCoj1jEm37dGx3F4orbfSaJI
X-Received: by 2002:a05:6a21:3a87:b0:398:89b6:1b41 with SMTP id adf61e73a8af0-3b328ecee16mr26618669637.32.1779946235169;
        Wed, 27 May 2026 22:30:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852056dadasm13739450a12.26.2026.05.27.22.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 22:30:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: sti: uniperif_reader: Use guard() for spin locks
Date: Thu, 28 May 2026 12:30:21 +0700
Message-ID: <20260528053021.46157-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Compile-tested only.

 sound/soc/sti/uniperif_reader.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sti/uniperif_reader.c b/sound/soc/sti/uniperif_reader.c
index 05ea2b794eb9..45d7613f595c 100644
--- a/sound/soc/sti/uniperif_reader.c
+++ b/sound/soc/sti/uniperif_reader.c
@@ -46,15 +46,16 @@ static irqreturn_t uni_reader_irq_handler(int irq, void *dev_id)
 	struct uniperif *reader = dev_id;
 	unsigned int status;
 
-	spin_lock(&reader->irq_lock);
+	guard(spinlock)(&reader->irq_lock);
 	if (!reader->substream)
-		goto irq_spin_unlock;
+		return ret;
 
 	snd_pcm_stream_lock(reader->substream);
 	if (reader->state == UNIPERIF_STATE_STOPPED) {
 		/* Unexpected IRQ: do nothing */
 		dev_warn(reader->dev, "unexpected IRQ\n");
-		goto stream_unlock;
+		snd_pcm_stream_unlock(reader->substream);
+		return ret;
 	}
 
 	/* Get interrupt status & clear them immediately */
@@ -70,10 +71,7 @@ static irqreturn_t uni_reader_irq_handler(int irq, void *dev_id)
 		ret = IRQ_HANDLED;
 	}
 
-stream_unlock:
 	snd_pcm_stream_unlock(reader->substream);
-irq_spin_unlock:
-	spin_unlock(&reader->irq_lock);
 
 	return ret;
 }
@@ -355,12 +353,10 @@ static int uni_reader_startup(struct snd_pcm_substream *substream,
 {
 	struct sti_uniperiph_data *priv = snd_soc_dai_get_drvdata(dai);
 	struct uniperif *reader = priv->dai_data.uni;
-	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&reader->irq_lock, flags);
-	reader->substream = substream;
-	spin_unlock_irqrestore(&reader->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &reader->irq_lock)
+		reader->substream = substream;
 
 	if (!UNIPERIF_TYPE_IS_TDM(reader))
 		return 0;
@@ -386,15 +382,13 @@ static void uni_reader_shutdown(struct snd_pcm_substream *substream,
 {
 	struct sti_uniperiph_data *priv = snd_soc_dai_get_drvdata(dai);
 	struct uniperif *reader = priv->dai_data.uni;
-	unsigned long flags;
 
-	spin_lock_irqsave(&reader->irq_lock, flags);
+	guard(spinlock_irqsave)(&reader->irq_lock);
 	if (reader->state != UNIPERIF_STATE_STOPPED) {
 		/* Stop the reader */
 		uni_reader_stop(reader);
 	}
 	reader->substream = NULL;
-	spin_unlock_irqrestore(&reader->irq_lock, flags);
 }
 
 static const struct snd_soc_dai_ops uni_reader_dai_ops = {
-- 
2.43.0

