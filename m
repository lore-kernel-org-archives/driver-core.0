Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB2C406274
	for <driver-core@lists.linux.dev>; Fri,  8 May 2026 16:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778258284; cv=none; b=p0Fc/M2m0qklPmj7YULaB8B/1AbuHpkQVKlWWo7Q/qsykpmOhJcjaDV4JocMcwATrlQfptTROocz7YrZsnAaAQmm6he5NV+Wm1tdmip4s5wKt8egcWeX23jN4rjn9c8G3HZXCUcuE+z5RsgTcdOOcQOXOCci/pEIv71sdPf0DBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778258284; c=relaxed/simple;
	bh=UA//K5KE5lxyKxBn51gpSzesiAf2ti5tilN0wFiDEj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pTlONrMJ53WTPWvPwVv+QjqMCYIcTAoxjv1+awb6dDY+yhjqFZQZh7eKrEd7xag4BJcOg8Fk5wKbj3fWsl4byRnfQqYe9WveUxmL23Qozs9O97yLmvBKbxI//4BoPZw1Jniz8TQ7cwEhIC4hcIzlrHWK6yqPXedFY05YI8epAmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJvsdzRK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJvsdzRK"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso19433005e9.2
        for <driver-core@lists.linux.dev>; Fri, 08 May 2026 09:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778258281; x=1778863081; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DTJW4BGtGQqxWbz4seH8/4tzQ7UIXmQ1TeDbULZ3Ovo=;
        b=VJvsdzRKwGnxMcy9wkoqcMgMrSDkVc0+GWGgAHJH7zHt/smm4e69JaxLy/Hx3ZaKT8
         PZbz+aD1UbSj05v0HGkcwjVLbSPFA7mJ+S/uj/BQzmsrlEg7uSg6buFjeBt5bou43RDc
         duoYUHKPNlua0MAlaQOwO2JzFhS5G9dPcqPNfntspheN95hD2i8U0r9iwj9XG5uw3xPu
         TusXxqKZDH9n3e5E0rhCNh5W3gjSJYdncFRId1DCfNg0w729YdhHQncYTh6AQpksuFZK
         u9M/HAUmjoeYaCqCpAeIXp3SchfHFSKiBS8HCyvAGHdWUlys6jOFyAyR9qPssmd8gKXW
         9K0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778258281; x=1778863081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTJW4BGtGQqxWbz4seH8/4tzQ7UIXmQ1TeDbULZ3Ovo=;
        b=kAMjYAPd3HMuk9QUNipiR0P8Fp+g12zJDgFwvQu1gK0URCz+jU+lIffUnRY3PRRq+L
         OQPjTLFU1PhDgG2jGao3i2y7FaCAEp7DVtXicnt3j7Mjr2nAHfzxX6Y2kru09WaGaVNF
         xOsxILZurmV4A9PPPBtEMMjlnbI4pOSzslDs7FfiEdxpVqOmlNERcSJ0euRcDZE//Nwy
         0EUHcSkSULw4qq2PzLOVhNmrNCBqVLobqqym9gpx4q4fG6oyf9HLz/tcVXvKPWgpVLVT
         2HCzVzO25ysDEs5lZAHtjUpmuyxAeNFwQhd82Qa0HTcmlDhblUrqYV8uUzNhD9ZN8yW2
         jZOw==
X-Forwarded-Encrypted: i=1; AFNElJ8p3Q+EFA6XxLwmAXD9haowqZ76WPeLRDUtBEnNenwBKYQjSml4OLNe4a28lBl/aIm1GP7HNV+3TieK9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyibU4hDTAhcNlcvNmkJ1L1L8h2c5dCgFzNLXpgCb1x4N81nGxZ
	h6LE7nFQ/+7ZUfveJoOTMmMyNMKKB+fOmJ1GYpQPnnM4jrsNlzb2D5VO
X-Gm-Gg: AeBDietA5OAvij95PUSbSfGR2CDvP6qi1NlNwzuQu+BqRrRTnq1UKwee3eL+6vt4ijW
	N8262rIEbE48y04h+2SyiWvjksmGvNEArgu7cu24iXcr26xp7+GlnHtSpOUywG4B1Ckqc0dwCZt
	yqmbfYMoXj19nATyJS3PMnNKGfWu2kSgQE6100zWzPcl92wZhgh5N9W5ktKqObxO/bWLTkqT9o7
	GjhBLP9l0tm7t1ns1x8iAl+RktDjU6aM4M6V+W8ina21KQO8BguwVBXVlNv991kYckn0fePGS3T
	EneZK96PClD9TiafVF8FQ5j5pOTE3pjoe+l9rDvmf4QwYPgVOnQ/afVAA5T9Dh8bzNkCTicyYiE
	5KWz4jIoswHxecMMycHRgfs0o7gXp3ytchu4JQltS3TjOpDucE6f4Fl/fw5q4l1XAnMBtAL68A9
	w3YS7tXdI1KQvDnECwQb/01uGTpqF/8MX9qBfoP37GrhLgMEmLMu+3/UohFQqjJqPh7w8=
X-Received: by 2002:a05:600c:8b0c:b0:48a:7a10:4f47 with SMTP id 5b1f17b1804b1-48e51e0a620mr219801715e9.3.1778258281158;
        Fri, 08 May 2026 09:38:01 -0700 (PDT)
Received: from arey-arch ([2a02:1210:7298:ec00:73f0:d2e7:188c:1f61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6d8e4f0dsm3379115e9.11.2026.05.08.09.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:38:00 -0700 (PDT)
From: Adrien Reynard <reynard.adrien.08@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Paulo Alcantara <pc@manguebit.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	rcu@vger.kernel.org (open list:READ-COPY UPDATE (RCU)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	driver-core@lists.linux.dev (open list:DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS),
	netfs@lists.linux.dev (open list:FILESYSTEMS [NETFS LIBRARY]),
	linux-fsdevel@vger.kernel.org (open list:FILESYSTEMS [NETFS LIBRARY]),
	linux-trace-kernel@vger.kernel.org (open list:TRACING)
Cc: Adrien Reynard <reynard.adrien.08@gmail.com>
Subject: [PATCH 2/5] docs: fix repeated word 'that' across documentation
Date: Fri,  8 May 2026 18:37:57 +0200
Message-ID: <20260508163759.16231-1-reynard.adrien.08@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Adrien Reynard <reynard.adrien.08@gmail.com>
---
 Documentation/RCU/rcu.rst                          | 2 +-
 Documentation/driver-api/driver-model/overview.rst | 2 +-
 Documentation/filesystems/netfs_library.rst        | 2 +-
 Documentation/trace/histogram-design.rst           | 2 +-
 Documentation/trace/histogram.rst                  | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/RCU/rcu.rst b/Documentation/RCU/rcu.rst
index bf6617b330a7..320ad3292b75 100644
--- a/Documentation/RCU/rcu.rst
+++ b/Documentation/RCU/rcu.rst
@@ -32,7 +32,7 @@ Frequently Asked Questions
   Just as with spinlocks, RCU readers are not permitted to
   block, switch to user-mode execution, or enter the idle loop.
   Therefore, as soon as a CPU is seen passing through any of these
-  three states, we know that that CPU has exited any previous RCU
+  three states, we know that CPU has exited any previous RCU
   read-side critical sections.  So, if we remove an item from a
   linked list, and then wait until all CPUs have switched context,
   executed in user mode, or executed in the idle loop, we can
diff --git a/Documentation/driver-api/driver-model/overview.rst b/Documentation/driver-api/driver-model/overview.rst
index b3f447bf9f07..c1966d506d55 100644
--- a/Documentation/driver-api/driver-model/overview.rst
+++ b/Documentation/driver-api/driver-model/overview.rst
@@ -55,7 +55,7 @@ struct pci_dev now looks like this::
 Note first that the struct device dev within the struct pci_dev is
 statically allocated. This means only one allocation on device discovery.
 
-Note also that that struct device dev is not necessarily defined at the
+Note also that struct device dev is not necessarily defined at the
 front of the pci_dev structure.  This is to make people think about what
 they're doing when switching between the bus driver and the global driver,
 and to discourage meaningless and incorrect casts between the two.
diff --git a/Documentation/filesystems/netfs_library.rst b/Documentation/filesystems/netfs_library.rst
index ddd799df6ce3..4033de4535ac 100644
--- a/Documentation/filesystems/netfs_library.rst
+++ b/Documentation/filesystems/netfs_library.rst
@@ -626,7 +626,7 @@ A number of members are available for access/use by the filesystem:
 
    These are set by the filesystem or the cache in ->prepare_read() or
    ->prepare_write() for each subrequest to indicate the maximum number of
-   bytes and, optionally, the maximum number of segments (if not 0) that that
+   bytes and, optionally, the maximum number of segments (if not 0) that
    subrequest can support.
 
  * ``submit_extendable_to``
diff --git a/Documentation/trace/histogram-design.rst b/Documentation/trace/histogram-design.rst
index e92f56ebd0b5..949bbfdb0f16 100644
--- a/Documentation/trace/histogram-design.rst
+++ b/Documentation/trace/histogram-design.rst
@@ -738,7 +738,7 @@ creates its own variable, wakeup_lat, but nothing yet uses it::
 
 Looking at the sched_waking 'hist_debug' output, in addition to the
 normal key and value hist_fields, in the val fields section we see a
-field with the HIST_FIELD_FL_VAR flag, which indicates that that field
+field with the HIST_FIELD_FL_VAR flag, which indicates that field
 represents a variable.  Note that in addition to the variable name,
 contained in the var.name field, it includes the var.idx, which is the
 index into the tracing_map_elt.vars[] array of the actual variable
diff --git a/Documentation/trace/histogram.rst b/Documentation/trace/histogram.rst
index 340bcb5099e7..5b303fabdf32 100644
--- a/Documentation/trace/histogram.rst
+++ b/Documentation/trace/histogram.rst
@@ -1700,7 +1700,7 @@ to that rule is that any variable used in an expression is essentially
 'read-once' - once it's used by an expression in a subsequent event,
 it's reset to its 'unset' state, which means it can't be used again
 unless it's set again.  This ensures not only that an event doesn't
-use an uninitialized variable in a calculation, but that that variable
+use an uninitialized variable in a calculation, but that variable
 is used only once and not for any unrelated subsequent match.
 
 The basic syntax for saving a variable is to simply prefix a unique
-- 
2.54.0

